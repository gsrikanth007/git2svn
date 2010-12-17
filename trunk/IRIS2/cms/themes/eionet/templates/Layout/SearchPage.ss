<h2>$Title</h2>

<form id="searchForm" method="get" action="home/search">
    <input id="searchField" type="text" name="q" value="$SearchQuery" />
    <input id="searchOption" type="submit" value="Search" />
</form>

<div id="searchSummary">
    <p>About $ResultsCount results</p>
    <p id="moreSearchResults"><a href="$MoreResultsUrl" title="View more results">View more results</a></p>
</div>

<div id="searchResults">
    $SearchResults
</div>

<div id="pagination">
    $Pagination
</div>