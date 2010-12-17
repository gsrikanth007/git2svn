<h2>$Title</h2>
$Content
$Form

<% if PaginatedArticles %>
<ul class="latestNews">
    <% control PaginatedArticles %>
    <li>
        <p>$Date.DayOfMonth $Date.Month $Date.Year</p>
        <h3><a href="$Link" title="$Title">$Title</a></h3>
        <p>$Content.FirstParagraph</p>
    </li>
    <% end_control %>
</ul>
<% end_if %>

<% if PaginatedArticles.MoreThanOnePage %>
    <div id="pagination">
        <% if PaginatedArticles.PrevLink %>
            <a href="$PaginatedArticles.PrevLink" title="&lt;&lt; Previous">&lt;&lt; Previous</a>
        <% else %>
            <span>&lt;&lt; Previous</span>
        <% end_if %>

        <% control PaginatedArticles.Pages %>
            <% if CurrentBool %>
                <strong>$PageNum</strong>
            <% else %>
                <a href="$Link" title="Page $PageNum">$PageNum</a>
            <% end_if %>
        <% end_control %>

        <% if PaginatedArticles.NextLink %>
            <a href="$PaginatedArticles.NextLink" title="Next &gt;&gt;">Next &gt;&gt;</a>
        <% else %>
            <span>Next &gt;&gt;</span>
        <% end_if %>
    </div>
<% end_if %>