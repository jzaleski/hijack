if (Hijack !== undefined && Hijack.Dragonrealms === undefined) {
  Hijack.Dragonrealms = (function() {
    var aliasData = function() {
      return {};
    };

    var highlightData = function() {
      return {
        defaults: highlightDefaults(),
        palette: highlightPalette(),
        patternsAndOpts: highlightPatternsAndOpts(),
        template: highlightTemplate()
      };
    };

    var highlightDefaults = function() {
      return {
        background: "background-color: transparent;",
        font: "font-family: inherit; font-size: inherit;",
        foreground: "color: inherit;"
      };
    };

    var highlightPalette = function() {
      return {};
    };

    var highlightPatternsAndOpts = function() {
      return [];
    };

    var highlightTemplate = function() {
      return "<span style=\"%{background}%{font}%{foreground}\">{value}</span>";
    };

    return {aliasData: aliasData, highlightData: highlightData};
  })();
}
