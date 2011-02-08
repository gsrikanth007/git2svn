<ul class="level1">
    <% control Menu(1) %>
        <li class="$LinkOrSection <% if First %>first<% end_if %> <% if Last %>last<% end_if %>">
            <a href="$Link" title="$Title.XML">$MenuTitle</a>
            <% if LinkOrSection = section %>
                <% if Children %>
                    <ul class="level2">
                        <% control Children %>
                            <li class="$LinkOrSection <% if First %>first<% end_if %> <% if Last %>last<% end_if %>">
                                <a class="<% if Children %>hasChildren<% else %>noChildren<% end_if %>" href="$Link" title="$Title.XML">$MenuTitle</a>
                                <% if LinkOrSection = section %>
                                    <% if Children %>
                                        <ul class="level3">
                                            <% control Children %>
                                                <li class="$LinkOrSection <% if First %>first<% end_if %> <% if Last %>last<% end_if %>">
                                                    <a href="$Link" title="$Title.XML">$MenuTitle</a>
                                                    <% if LinkOrSection = section %>
                                                        <% if Children %>
                                                            <ul class="level4">
                                                                <% control Children %>
                                                                    <li class="$LinkOrSection <% if First %>first<% end_if %> <% if Last %>last<% end_if %>">
                                                                        <a href="$Link" title="$Title.XML">$MenuTitle</a>
                                                                    </li>
                                                                <% end_control %>
                                                            </ul>
                                                        <% end_if %>
                                                    <% end_if %>
                                                </li>
                                            <% end_control %>
                                        </ul>
                                    <% end_if %>
                                <% end_if %>
                            </li>
                        <% end_control %>
                    </ul>
                <% end_if %>
            <% end_if %>
        </li>
    <% end_control %>
</ul>