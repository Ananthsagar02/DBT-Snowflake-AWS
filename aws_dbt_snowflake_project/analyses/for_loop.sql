{% set my_list = ['BOOKING_ID', 'NIGHTS_BOOKED', 'BOOKING_AMOUNT'] %}

select 
    {% for item in my_list %}
      "{{ item }}"
        {% if not loop.last %}, {% endif %}
    {% endfor %}
from {{ ref('bronze_bookings') }}