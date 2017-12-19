{% macro paginator(name, helper, query, paginator) %}
  <nav class="pagination" role="navigation" aria-label="pagination">
    <ul class="pagination-list">
      {% if paginator.has_previous_page %}
      <li>
        <a href="{{ helper.pathFor(name, { page: paginator.previous_page, type: query.type }) }}" class="button pagination-previous"><前页</a>
      </li>
      {% endif %}
      {% if paginator.first_page != 1 %}
      <li>
        <a href="{{ helper.pathFor(name, { page: 1, type: query.type }) }}" class="button pagination-link">首页</a>
      </li>
      {% endif %}
      {% if paginator.total_pages > 1 %}
        {% for i in range(paginator.first_page, paginator.last_page+1) -%}
        <li>
          <a href="{{ helper.pathFor(name, { page: i, type: query.type }) }}" class="button pagination-link {{ 'is-current' if i == paginator.current_page  }}">{{ i }}</a>
        </li>
        {%- endfor %}
      {%- endif %}
      {% if paginator.has_next_page %}
      <li>
        <a href="{{ helper.pathFor(name, { page: paginator.next_page, type: query.type }) }}" class="button pagination-next">后页></a>
      </li>
      {% endif %}
    </ul>
  </nav>
{% endmacro %}