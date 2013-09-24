var Hijack = (function() {

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
      config,
      defaultOptions = {
        pollingIntervalMS: 10
      },
      numCols,
      numRows;

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
        numCols: numCols,
        numRows: numRows
      }),
      success: function() {
        $game.val('');
        $bridge.val('');
        $account.val('');
        $password.val('');
        $character.val('');
        $connectContainer.css('visibility', 'hidden');
        $gameContainer.css('visibility', 'visible');
        $input.focus();
        gets();
      },
      error: function(jqXHR, textStatus, errorThrown) {
        if (jqXHR && jqXHR.responseText !== undefined) {
          alert(jqXHR.responseText);
        }
      }
    });
  };

  var disconnect = function(input) {
    $.ajax({
      type: 'POST',
      url: '/disconnect',
      data: input,
      success: function() {
        $.ajaxBuffer.abortAll();
        $gameContainer.css('visibility', 'hidden');
        $output.val('');
        $input.val('');
        $connectContainer.css('visibility', 'visible');
        $game.focus();
      }
    });
  };

  var gets = function() {
    setTimeout(function() {
      $.ajax({
        url: '/gets',
        success: function(output) {
          if (output.length > 0) {
            $output.html($output.html() + htmlify(output));
            $output.scrollTop($output[0].scrollHeight);
          }
          gets();
        }
      });
    }, config.pollingIntervalMS);
  };

  var htmlify = function(str) {
    return $.reduce([
        [/ /g, '&nbsp;'],
        [/\[0m/g, '</strong>'],
        [/\[1m/g, '<strong>'],
        [/\n/g, '<br/>']
      ],
      str,
      function(workingValue, arrayIndex, arrayValue) {
        return workingValue.replace(arrayValue[0], arrayValue[1]);
      }
    );
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
    // calculate "numCols"
    numCols = Math.floor($output.width() / $testSizeTest.width());
    // calculate "numRows"
    numRows = Math.floor($output.height() / $testSizeTest.height());
    // remove the test-element
    $testSizeTest.remove();
    // wire up the "puts" handler
    $input.keyup(function(event) {
      if (event.which == 13) {
        puts($.trim($input.val()));
        $input.val('');
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
          $this.blur();
          connect();
        }
      });
    });
    // set focus to the "game" field initially
    $game.focus();
  };

  var puts = function(input) {
    if (input.length > 0) {
      if (input.match(/^(exit|quit)$/)) {
        disconnect(input);
      } else {
        $.ajax({
          type: 'POST',
          url: '/puts',
          data: input,
          error: function(jqXHR, textStatus, errorThrown) {
            // TODO: possibly retry?
          }
        });
      }
    }
  };

  return {
    init: init
  };

})();
