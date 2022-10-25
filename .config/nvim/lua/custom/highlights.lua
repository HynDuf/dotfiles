local M = {}
M.override = {
  -- Visual background color override
  Visual = { bg = "#2f263d" },
  CursorLineNr = { fg = "#7aa2f7" },
}
M.add = {
  NavicText = {
    fg = "#7aa2f7",
    bg = "statusline_bg",
  },
  NavicSeparator = {
    default = true,
    bg = "statusline_bg",
    fg = "#abb2bf",
  },
  NavicIconsTypeParameter = {
    default = true,
    bg = "statusline_bg",
    fg = "#f7768e",
  },
  NavicIconsOperator = {
    default = true,
    bg = "statusline_bg",
    fg = "#d19a66",
  },
  NavicIconsEvent = {
    default = true,
    bg = "statusline_bg",
    fg = "#9ece6a",
  },
  NavicIconsStruct = {
    default = true,
    bg = "statusline_bg",
    fg = "#e5c890",
  },
  NavicIconsEnumMember = {
    default = true,
    bg = "statusline_bg",
    fg = "#ad8ee6",
  },
  NavicIconsNull = {
    default = true,
    bg = "statusline_bg",
    fg = "#e0af68",
  },
  NavicIconsKey = {
    default = true,
    bg = "statusline_bg",
    fg = "#94e2d5",
  },
  NavicIconsObject = {
    default = true,
    bg = "statusline_bg",
    fg = "#f5c2e7",
  },
  NavicIconsArray = {
    default = true,
    bg = "statusline_bg",
    fg = "#ad8ee6",
  },
  NavicIconsBoolean = {
    default = true,
    bg = "statusline_bg",
    fg = "#c8ccd4",
  },
  NavicIconsNumber = {
    default = true,
    bg = "statusline_bg",
    fg = "#ff9e64",
  },
  NavicIconsString = {
    default = true,
    bg = "statusline_bg",
    fg = "#f7768e",
  },
  NavicIconsConstant = {
    default = true,
    bg = "statusline_bg",
    fg = "#94e2d5",
  },
  NavicIconsVariable = {
    default = true,
    bg = "statusline_bg",
    fg = "#9ece6a",
  },
  NavicIconsFunction = {
    default = true,
    bg = "statusline_bg",
    fg = "#bdb2ff",
  },
  NavicIconsInterface = {
    default = true,
    bg = "statusline_bg",
    fg = "#449dab",
  },
  NavicIconsEnum = {
    default = true,
    bg = "statusline_bg",
    fg = "#d19a66",
  },
  NavicIconsConstructor = {
    default = true,
    bg = "statusline_bg",
    fg = "#ad8ee6",
  },
  NavicIconsField = {
    default = true,
    bg = "statusline_bg",
    fg = "#0db9d7",
  },
  NavicIconsProperty = {
    default = true,
    bg = "statusline_bg",
    fg = "#dd7878",
  },
  NavicIconsMethod = {
    default = true,
    bg = "statusline_bg",
    fg = "#babbf1",
  },
  NavicIconsClass = {
    default = true,
    bg = "statusline_bg",
    fg = "#a6d189",
  },
  NavicIconsPackage = {
    default = true,
    bg = "statusline_bg",
    fg = "#ff9e64",
  },
  NavicIconsNamespace = {
    default = true,
    bg = "statusline_bg",
    fg = "#ea999c",
  },
  NavicIconsModule = {
    default = true,
    bg = "statusline_bg",
    fg = "#449dab",
  },
  NavicIconsFile = {
    default = true,
    bg = "statusline_bg",
    fg = "#D08770",
  },
}

return M
