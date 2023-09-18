view: flights {
  sql_table_name: demo_db.flights ;;

  dimension: arr_delay {
    type: number
    sql: ${TABLE}.arr_delay ;;
  }
  dimension_group: arr {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.arr_time ;;
  }
  dimension: cancelled {
    type: string
    sql: ${TABLE}.cancelled ;;
    #html: <img src=”https://logo-core.clearbit.com/looker.com” />;;
  }
  dimension: carrier {
    type: string
    sql: ${TABLE}.carrier ;;
  }
  dimension: dep_delay {
    type: number
    sql: ${TABLE}.dep_delay ;;
  }
  dimension_group: dep {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.dep_time ;;
  }
  dimension: date_diff {
    type: number
    sql: datediff(${arr_date},${dep_date}) ;;
  }
  dimension_group: duration {
    type: duration
    intervals: [day]
    sql_start: ${arr_date} ;;
    sql_end: ${dep_date} ;;
  }
  dimension: destination {
    type: string
    sql: ${TABLE}.destination ;;
  }
  dimension: distance {
    type: number
    sql: ${TABLE}.distance ;;
  }
  dimension: diverted {
    type: string
    sql: ${TABLE}.diverted ;;
  }
  dimension: flight_num {
    type: string
    sql: ${TABLE}.flight_num ;;
  }
  dimension: flight_time {
    type: number
    sql: ${TABLE}.flight_time ;;
  }
  dimension: id2 {
    type: number
    sql: ${TABLE}.id2 ;;
  }
  dimension: origin {
    type: string
    sql: ${TABLE}.origin ;;
  }
  dimension: tail_num {
    type: string
    sql: ${TABLE}.tail_num ;;
  }
  dimension: taxi_in {
    type: number
    sql: ${TABLE}.taxi_in ;;
  }
  dimension: taxi_out {
    type: number
    sql: ${TABLE}.taxi_out ;;
  }
  dimension: text {
    type: string
    sql: "see html You can use html and some liquid to format text to appear on multiple lines. T
    his can be useful if you have a dimension that has really long strings as values and you want to see the text on multiple lines in a single value visualization. Note, not all visualization types support this. Some ignore the html formatting.

Here is some code that will put a new line after every two words." ;;
  }
  dimension: formatted_text {
    type: string
    sql: ${text} ;;
    # html: {% assign words = {{value}} | split: '- ' %}
    # {% assign n = 0 %}
    # {% for word in words %}
    #   {% if n==0 %} <p> {{word}} </p>
    #     {% else %} <li> {{ word }} </li>
    #   {% endif % }
    # {% assign n=1 %}
    # {% endfor %};;
    html: |
    {% assign sentences = value | split: '. ' %}
    {% assign s=0 %}
    {% for sentence in sentences %}

      {% assign words = sentence | split: ' ' %}
      {% for word in words %}

        {{ word }}{% unless forloop.last %} {% endunless %}
      {% endfor %}

       <br>
        {% if s ==0 %}
        <li>
        {% endif %}
        {% assign s = s | plus : 1 %}

      {% unless forloop.last %}
      {% endunless %}

    {% endfor %};;
  }
  measure: count {
    type: count
  }
}
