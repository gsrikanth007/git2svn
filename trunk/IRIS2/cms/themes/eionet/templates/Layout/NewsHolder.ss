<h1>$Title</h1>
$Content
$Form

<% if PaginatedArticles %>
<ul class="latestNews">
    <% control PaginatedArticles %>
    <li>
        <h2><a href="$Link" title="$Title">$Title</a></h2>
        <div class="calendar $Date.Month.Lowercase"><span>$Date.DayOfMonth</span> $Date.Year</div>
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
            <span class="disabled">&lt;&lt; Previous</span>
        <% end_if %>

        <% control PaginatedArticles.Pages %>
            <% if CurrentBool %>
                <span><strong>$PageNum</strong></span>
            <% else %>
                <a href="$Link" title="Page $PageNum">$PageNum</a>
            <% end_if %>
        <% end_control %>

        <% if PaginatedArticles.NextLink %>
            <a href="$PaginatedArticles.NextLink" title="Next &gt;&gt;">Next &gt;&gt;</a>
        <% else %>
            <span class="disabled">Next &gt;&gt;</span>
        <% end_if %>
    </div>
<% end_if %>