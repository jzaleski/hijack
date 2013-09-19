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
      num_cols,
      num_rows;

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
        num_cols: num_cols,
        num_rows: num_rows,
        strip_ansi_escape_sequences: true
      }),
      success: function() {
        $game.val('');
        $bridge.val('');
        $account.val('');
        $password.val('');
        $character.val('');
        $connectContainer.hide(function() {
          $gameContainer.show(function() {
            $input.focus();
            gets();
          });
        });
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
        $gameContainer.hide(function() {
          $output.val('');
          $input.val('');
          $connectContainer.show(function() {
            $game.focus();
          });
        });
      }
    });
  };

  var gets = function() {
    setTimeout(function() {
      $.ajax({
        url: '/gets',
        success: function(output) {
          if (output.length > 0) {
            $output.val($output.val() + output);
            $output.scrollTop($output[0].scrollHeight);
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
    // ensure that "cols" is defined on "output"
    num_cols = Number($output.attr('cols'));
    if (isNaN(num_cols)) {
      num_cols = Math.min(125, Math.floor($(document).width() / 8.5));
      $output.attr('cols', num_cols);
    }
    // ensure that "rows" is defined on "output"
    num_rows = Number($output.attr('rows'));
    if (isNaN(num_rows)) {
      num_rows = Math.min(40, Math.floor($(document).height() / 20.0));
      $output.attr('rows', num_rows);
    }
    // ensure "input" exists within "gameContainer"
    $input = $('#input', $gameContainer);
    if ($input.length != 1) {
      throw 'Must define an element with id "input" inside "gameContainer"';
    }
    // wire up the "puts" handler
    $input.keyup(function(event) {
      if (event.which == 13) {
        puts($input.val().trim());
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
    // set focus to the game field
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
