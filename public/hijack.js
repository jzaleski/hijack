var Hijack = (function($) {
  var $account,
      $bridge,
      $character,
      $connect,
      $connectContainer,
      $game,
      $gameContainer,
      $input,
      $output,
      $password,
      commandHistory = [],
      commandHistoryIndex = -1,
      config,
      defaultOptions = {
        maxScrollbackLines: 500,
        pollingIntervalMS: 0,
        stripPlayerStatusPrompt: true,
        stripRetryableOutput: true
      },
      scrollbackLines = [];

  var connect = function() {
    $.ajax({
      type: 'POST',
      url: '/connect',
      data: JSON.stringify({
        game: $game.val(),
        bridge: $bridge.val(),
        account: $account.val(),
        password: $password.val(),
        character: $character.val(),
        numCols: config.numCols,
        numRows: config.numRows,
        stripPlayerStatusPrompt: config.stripPlayerStatusPrompt,
        stripRetryableOutput: config.stripRetryableOutput
      }),
      success: function() {
        $game.val('');
        resetElement($bridge);
        disableElement($bridge);
        resetElement($account);
        resetElement($password);
        resetElement($character);
        $connectContainer.css('visibility', 'hidden');
        $gameContainer.css('visibility', 'visible');
        $input.focus();
        gets();
      },
      error: function(jqXHR, textStatus, errorThrown) {
        if (jqXHR && jqXHR.responseText !== undefined) {
          alert(jqXHR.responseText);
        }
        $connect.focus();
      }
    });
  };

  var disableElement = function($element) {
    $element.attr('disabled', 'disabled');
  }

  var disconnect = function(str) {
    $.ajax({
      type: 'POST',
      url: '/disconnect',
      data: str,
      success: function() {
        $.ajaxBuffer.abortAll();
        $gameContainer.css('visibility', 'hidden');
        resetElement($output);
        resetElement($input);
        $connectContainer.css('visibility', 'visible');
        $game.focus();
      }
    });
  };

  var enableElement = function($element) {
    $element.removeAttr('disabled');
  }

  var gets = function() {
    setTimeout(function() {
      $.ajax({
        url: '/gets',
        success: function(str) {
          if (str.length > 0) {
            updateOutput(str);
          }
          gets();
        }
      });
    }, config.pollingIntervalMS);
  };

  var init = function(options) {
    // merge the defaults w/ the passed in options
    config = $.extend({}, defaultOptions, options);
    // ensure "connectContainerSelector" is specified and exists
    $connectContainer = $(config.connectContainerSelector);
    if ($connectContainer.length != 1) {
      throw 'Must specify a valid "connectContainerSelector"';
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
          if (commandHistoryIndex < (commandHistory.length -1)) {
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
    $.each([$game, $bridge, $account, $password, $character], function(index, element) {
      var $this = $(this);
      $this.keyup(function(event) {
        if (event.which == 13) {
          connect();
        }
      });
    });
    // load the game
    loadAvailableGames();
    // wire up the change handler for the game dropdown
    $game.change(function() {
      resetElement($bridge);
      disableElement($bridge);
      loadAvailableBridges($game.val());
    });
    // set focus to the "game" field initially
    $game.focus();
  };

  var loadAvailableBridges = function(game) {
    if (game.length > 0) {
      $.ajax({
        type: 'GET',
        url: '/bridges',
        data: {game: game},
        success: function(bridges) {
          resetElement($bridge);
          $.each(bridges, function(index, bridge) {
            $bridge.append(new Option(formatString(bridge), bridge));
          });
          enableElement($bridge);
        }
      });
    }
  };

  var formatString = function(str) {
    return $.map(str.split('_'), function(strPart) {
      return strPart.substr(0,1).toUpperCase() + strPart.substr(1);
    }).join(' ');
  }

  var loadAvailableGames = function() {
    $.ajax({
      type: 'GET',
      url: '/games',
      success: function(games) {
        resetElement($game);
        resetElement($bridge);
        disableElement($bridge);
        $.each(games, function(index, game) {
          $game.append(new Option(formatString(game), game));
        });
      }
    });
  };

  var puts = function(str) {
    if (str.length > 0) {
      if (str.match(/^(exit|quit)$/)) {
        disconnect(str);
      } else {
        commandHistory.unshift(str);
        $.ajax({
          type: 'POST',
          url: '/puts',
          data: str,
          error: function(jqXHR, textStatus, errorThrown) {
            // TODO: possibly retry?
          }
        });
      }
    }
  };

  var resetElement = function($element) {
    if ($element.is('select')) {
      $element.empty().append(new Option('--- SELECT ONE ---', ''));
    } else {
      $element.val('');
    }
  }

  var setInput = function(str) {
    if (str !== undefined) {
      $input.val(str);
    }
  };

  var updateOutput = function(str) {
    // first, append the new line
    scrollbackLines.push(str);
    // trim the line-buffer (if necessary)
    if (scrollbackLines.length > config.maxScrollbackLines) {
      scrollbackLines = scrollbackLines.slice(
        scrollbackLines.length - config.maxScrollbackLines);
    }
    // generate the output (at this point the output format does not matter)
    var output = scrollbackLines.join('');
    // update the UI
    $output.html(output);
    // scroll the "output" element to the bottom
    $output.scrollTop($output[0].scrollHeight);
  };

  return {
    init: init
  };
})(jQuery);
