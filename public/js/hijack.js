var Hijack = (function($) {
  var $account,
      $bridge,
      $character,
      $connect,
      $connectContainer,
      $error,
      $game,
      $gameContainer,
      $input,
      $output,
      $password,
      commandHistory,
      commandHistoryIndex,
      config,
      defaultOptions = {
        enableLichNet: true,
        maxScrollbackLines: 500,
        stripPlayerStatusPrompt: false,
        stripRetryableOutput: false
      },
      scrollbackLines,
      websocket;

  var aliasData = function(game) {
    if (!game || game.length == 0) {
      return {};
    }
    var gameModule = snakeCaseToCamelCase(game);
    if (!Hijack.hasOwnProperty(gameModule)) {
      return {};
    }
    return Hijack[gameModule].aliasData();
  };

  var connect = function() {
    if (WebSocket !== undefined) {
      connectWebSocket();
    } else {
      connectAjax();
    }
  };

  var connectAjax = function() {
    $.ajax({
      type: 'POST',
      url: '/connect',
      data: requestData(connectData()),
      success: function() {
        gets();
        onConnectSuccess();
      },
      error: function(jqXHR, textStatus, errorThrown) {
        onDisconnect(jqXHR.responseText);
      }
    });
  };

  var connectData = function() {
    var game = $game.val();
    return {
      game: game,
      bridge: $bridge.val(),
      account: $account.val(),
      password: $password.val(),
      character: $character.val(),
      numCols: config.numCols,
      numRows: config.numRows,
      enableLichNet: config.enableLichNet,
      stripPlayerStatusPrompt: config.stripPlayerStatusPrompt,
      stripRetryableOutput: config.stripRetryableOutput,
      aliases: aliasData(game),
      highlights: highlightData(game)
    };
  };

  var connectWebSocket = function() {
    websocket = new WebSocket('ws://' + window.location.host + '/connect');
    websocket.onclose = function(closeEvent) {
      onDisconnect($output.children().length == 0 ? $output.html() : null);
    };
    websocket.onmessage = function(messageEvent) {
      onMessage(JSON.parse(messageEvent.data));
    };
    websocket.onopen = function(openEvent) {
      websocket.send(JSON.stringify(requestData(connectData())));
      onConnectSuccess();
    };
  };

  var disableElement = function($element) {
    $element.attr('disabled', 'disabled');
  };

  var disconnect = function(str) {
    if (websocket !== undefined) {
      disconnectWebSocket(str);
    } else {
      disconnectAjax(str);
    }
  };

  var disconnectAjax = function(str) {
    $.ajax({
      type: 'POST',
      url: '/disconnect',
      data: requestData(str),
      complete: function() {
        $.ajaxBuffer.abortAll();
        onDisconnect();
      }
    });
  };

  var disconnectWebSocket = function(str) {
    putsWebSocket(str);
    websocket.close();
    onDisconnect();
  };

  var enableElement = function($element) {
    $element.removeAttr('disabled');
  };

  var gets = function() {
    $.ajax({
      url: '/gets',
      success: function(result) {
        onMessage(result);
        gets();
      },
      error: function(jqXHR, textStatus, errorThrown) {
        onDisconnect(jqXHR.responseText);
      }
    });
  };

  var highlightData = function(game) {
    if (!game || game.length == 0) {
      return {};
    }
    var gameModule = snakeCaseToCamelCase(game);
    if (!Hijack.hasOwnProperty(gameModule)) {
      return {};
    }
    return Hijack[gameModule].highlightData();
  };

  var init = function(options) {
    // merge the defaults w/ the passed in options
    config = $.extend(
      {},
      defaultOptions,
      options
    );
    // ensure "connectContainerSelector" is specified and exists
    $connectContainer = $(config.connectContainerSelector);
    if ($connectContainer.length != 1) {
      throw 'Must specify a valid "connectContainerSelector"';
    }
    // ensure "error" exists within "connectContainer"
    $error = $('#error', $connectContainer);
    if ($error.length != 1) {
      throw 'Must define an element with id "error" inside "connectContainer"';
    }
    // ensure "game" exists within "connectContainer"
    $game = $('#game', $connectContainer);
    if ($game.length != 1) {
      throw 'Must define an element with id "game" inside "connectContainer"';
    }
    // ensure "bridge" exists within "connectContainer"
    $bridge = $('#bridge', $connectContainer);
    if ($bridge.length != 1) {
      throw 'Must define an element with id "bridge" inside "connectContainer"';
    }
    // ensure "account" exists within "connectContainer"
    $account = $('#account', $connectContainer);
    if ($account.length != 1) {
      throw 'Must define an element with id "account" inside "connectContainer"';
    }
    // ensure "password" exists within "connectContainer"
    $password = $('#password', $connectContainer);
    if ($password.length != 1) {
      throw 'Must define an element with id "password" inside "connectContainer"';
    }
    // ensure "character" exists within "connectContainer"
    $character = $('#character', $connectContainer);
    if ($character.length != 1) {
      throw 'Must define an element with id "character" inside "connectContainer"';
    }
    // ensure "connect" exists within "connectContainer"
    $connect = $('#connect', $connectContainer);
    if ($connect.length != 1) {
      throw 'Must define an element with id "connect" inside "connectContainer"';
    }
    // ensure "gameContainerSelector" is specified and exists
    $gameContainer = $(config.gameContainerSelector);
    if ($gameContainer.length != 1) {
      throw 'Must specify a valid "gameContainerSelector"';
    }
    // ensure "output" exists within "gameContainer"
    $output = $('#output', $gameContainer);
    if ($output.length != 1) {
      throw 'Must define an element with id "output" inside "gameContainer"';
    }
    // ensure "input" exists within "gameContainer"
    $input = $('#input', $gameContainer);
    if ($input.length != 1) {
      throw 'Must define an element with id "input" inside "gameContainer"';
    }
    // create an element that will inherit the styles of its container
    var $testSizeTest = $('<span id="text-size-test">A</span>');
    // temporarily append the test-element to the container
    $output.append($testSizeTest);
    // calculate "numCols" (if it wasn't explicitly specified)
    if (config.numCols === undefined) {
      config.numCols = Math.floor($output.width() / $testSizeTest.width());
    }
    // calculate "numRows" (if it wasn't explicitly specified)
    if (config.numRows === undefined) {
      config.numRows = Math.floor($output.height() / $testSizeTest.height());
    }
    // remove the test-element
    $testSizeTest.remove();
    // wire up the "puts" handler
    $input.keyup(function(event) {
      // stop event propagation
      event.preventDefault();
      // wire up special handlers
      switch (event.which) {
        // enter/return
        case 13:
          puts($.trim($input.val()));
          resetElement($input);
          break;
        // up arrow
        case 38:
          if (commandHistoryIndex < (commandHistory.length - 1)) {
            setInput(commandHistory[++commandHistoryIndex]);
          }
          break;
        // down arrow
        case 40:
          if (commandHistoryIndex != -1) {
            var command = commandHistory[--commandHistoryIndex];
            setInput(commandHistoryIndex == -1 ? '' : command);
          }
          break;
      }
    });
    // wire up the "connect" handler
    $connect.click(function(event) {
      connect();
    });
    // trigger the "connect" handler if enter is pressed in an input field
    $.each([
      $account,
      $bridge,
      $character,
      $game,
      $password
    ], function(index, element) {
      $(this).keyup(function(event) {
        if (event.which == 13) {
          connect();
        }
      });
    });
    // load the available game list
    loadAvailableGames();
    // wire up the change handler for the game dropdown
    $game.change(function() {
      resetElement($bridge);
      disableElement($bridge);
      var game = $game.val();
      loadAvailableBridges(game);
      loadGameSpecificModule(game);
    });
    // set focus to the "game" field initially
    $game.focus();
  };

  var loadAvailableBridges = function(game) {
    if (game.length > 0) {
      $.ajax({
        type: 'GET',
        url: '/bridges',
        data: requestData(game),
        success: function(result) {
          var bridges = responseData(result);
          resetElement($bridge);
          $.each(bridges, function(index, bridge) {
            $bridge.append(new Option(snakeCaseToPhrase(bridge), bridge));
          });
          enableElement($bridge);
        }
      });
    }
  };

  var loadGameSpecificModule = function(game) {
    if (game && game.length > 0) {
      $.ajax({
        async: false,
        cache: true,
        dataType: 'script',
        url: 'js/hijack-' + game + '.js'
      });
    }
  };

  var loadAvailableGames = function() {
    $.ajax({
      type: 'GET',
      url: '/games',
      success: function(result) {
        var games = responseData(result);
        resetElement($game);
        resetElement($bridge);
        disableElement($bridge);
        $.each(games, function(index, game) {
          $game.append(new Option(snakeCaseToPhrase(game), game));
        });
      }
    });
  };

  var onConnectSuccess = function() {
    $game.val('');
    resetElement($bridge);
    disableElement($bridge);
    resetElement($account);
    resetElement($password);
    resetElement($character);
    resetElement($error);
    commandHistory = [];
    commandHistoryIndex = -1;
    resetElement($input);
    scrollbackLines = -1;
    $output.html('');
    $error.hide();
    $connectContainer.css('visibility', 'hidden');
    $gameContainer.css('visibility', 'visible');
    $input.focus();
  };

  var onDisconnect = function(str) {
    $gameContainer.css('visibility', 'hidden');
    resetElement($output);
    resetElement($input);
    if (str && str.length > 0) {
      showError(str);
    }
    $connectContainer.css('visibility', 'visible');
    $game.focus();
  };

  var onMessage = function(message) {
    var str = responseData(message);
    if (str && str.length > 0) {
      updateOutput(str);
    }
  };

  var puts = function(str) {
    if (!str || str.length === 0) {
      return;
    }
    if (str.match(/^(exit|quit)$/)) {
      disconnect(str);
      return;
    }
    commandHistory.unshift(str);
    commandHistoryIndex = -1;
    if (websocket !== undefined) {
      putsWebSocket(str);
    } else {
      putsAjax(str);
    }
  };

  var putsAjax = function(str) {
    $.ajax({
      type: 'POST',
      url: '/puts',
      data: requestData(str)
    });
  };

  var putsWebSocket = function(str) {
    websocket.send(JSON.stringify(requestData(str)));
  };

  var requestData = function(value) {
    return value ? {data: value} : null;
  };

  var resetElement = function($element) {
    if ($element.is('select')) {
      $element.empty().append(new Option('--- SELECT ONE ---', ''));
    } else {
      $element.val('');
    }
  };

  var responseData = function(value) {
    return value && value.data ? value.data : null;
  };

  var setInput = function(str) {
    if (str && str.length > 0) {
      $input.val(str);
    }
  };

  var showError = function(str) {
    if (str && str.length > 0) {
      $error.show(function() {
        $(this).html(str);
      });
    }
  };

  var snakeCaseToCamelCase = function(str) {
    return $.map(str.split('_'), function(strPart) {
      return strPart.substr(0, 1).toUpperCase() + strPart.substr(1);
    }).join('');
  }

  var snakeCaseToPhrase = function(str) {
    return $.map(str.split('_'), function(strPart) {
      return strPart.substr(0, 1).toUpperCase() + strPart.substr(1);
    }).join(' ');
  }

  var updateOutput = function(str) {
    // update the UI
    $output.append(str);
    // increment the line counter (only do this up to `config.maxScrollbackLines`)
    if (scrollbackLines < config.maxScrollbackLines) scrollbackLines += 1;
    // if we've hit the maximum number of scrollback lines, delete the first element
    if (scrollbackLines === config.maxScrollbackLines) $output.find('pre').first().remove();
    // scroll the "output" element to the bottom
    $output.scrollTop($output[0].scrollHeight);
  };

  return {init: init};
})(jQuery);
