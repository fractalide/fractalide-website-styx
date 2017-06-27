{ lib }:
with lib;
{
  news.index.itemsPerPage = mkOption {
    default = 5;
    description = "Number of news per page on the news index page.";
    type = types.int;
  };
}
