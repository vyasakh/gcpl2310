view: smartdrive {
  derived_table: {
    sql:
     SELECT
      started_at
      ,user_id
      ,account_id
      ,org_id
      ,name
      ,group_concat(cast(group_id as char) order by group_id asc) as group_id
      ,group_concat(group_name order by group_name asc) as group_name
      FROM
      (
    SELECT DATE_FORMAT( "Fri Jul 28 07:30:00 2023", "%a %b %d %H:%M:%S %Y") as started_at, 88902 as user_id, 77334 as account_id, 22076 as org_id, "ben" as name, 8275 as group_id, "all users" as group_name
    union all
    SELECT DATE_FORMAT( "Fri Jul 28 07:30:00 2023", "%a %b %d %H:%M:%S %Y") as started_at, 88902 as user_id, 77334 as account_id, 22076 as org_id, "ben" as name, 16452 as group_id, "test" as group_name
    union all
    SELECT DATE_FORMAT( "Fri Jul 28 07:30:00 2023", "%a %b %d %H:%M:%S %Y") as started_at, 88902 as user_id, 77334 as account_id, 22076 as org_id, "ben" as name, 29965 as group_id, "smartdrive" as group_name
    union all
    SELECT DATE_FORMAT( "Tue Jul 25 07:30:00 2023", "%a %b %d %H:%M:%S %Y") as started_at, 51181 as user_id, 46606 as account_id, 22076 as org_id, "jeff" as name, 8275 as group_id, "all users" as group_name
    union all
    SELECT DATE_FORMAT( "Tue Jul 25 07:30:00 2023", "%a %b %d %H:%M:%S %Y") as started_at, 51181 as user_id, 46606 as account_id, 22076 as org_id, "jeff" as name, 9251 as group_id, "YP" as group_name
    union all
    SELECT DATE_FORMAT( "Tue Jul 25 07:30:00 2023", "%a %b %d %H:%M:%S %Y") as started_at, 51181 as user_id, 46606 as account_id, 22076 as org_id, "jeff" as name, 16703 as group_id, "all users" as group_name
    union all
    SELECT DATE_FORMAT( "Tue Jul 25 07:30:00 2023", "%a %b %d %H:%M:%S %Y") as started_at, 51181 as user_id, 46606 as account_id, 22076 as org_id, "jeff" as name, 25353 as group_id, "tokyo" as group_name
    union all
    SELECT DATE_FORMAT( "Thu Jul 27 07:30:00 2023", "%a %b %d %H:%M:%S %Y") as started_at, 97176 as user_id, 84056 as account_id, 22076 as org_id, "thomas" as name, 8275 as group_id, "all users" as group_name
    union all
    SELECT DATE_FORMAT( "Thu Jul 27 07:30:00 2023", "%a %b %d %H:%M:%S %Y") as started_at, 97176 as user_id, 84056 as account_id, 22076 as org_id, "thomas" as name, 29965 as group_id, "smartdrive" as group_name
    union all
    SELECT DATE_FORMAT( "Thu Jul 27 07:30:00 2023", "%a %b %d %H:%M:%S %Y") as started_at, 19434 as user_id, 17941 as account_id, 22076 as org_id, "amber" as name, 8275 as group_id, "all users" as group_name
    union all
    SELECT DATE_FORMAT( "Thu Jul 27 07:30:00 2023", "%a %b %d %H:%M:%S %Y") as started_at, 19434 as user_id, 17941 as account_id, 22076 as org_id, "amber" as name, 16451 as group_id, "test" as group_name
    union all
    SELECT DATE_FORMAT( "Thu Jul 27 07:30:00 2023", "%a %b %d %H:%M:%S %Y") as started_at, 19442 as user_id, 17949 as account_id, 22076 as org_id, "joe" as name, 8275 as group_id, "all users" as group_name
    union all
    SELECT DATE_FORMAT( "Thu Jul 27 07:30:00 2023", "%a %b %d %H:%M:%S %Y") as started_at, 19442 as user_id, 17949 as account_id, 22076 as org_id, "joe" as name, 16451 as group_id, "test" as group_name
    union all
    SELECT DATE_FORMAT( "Thu Jul 27 07:30:00 2023", "%a %b %d %H:%M:%S %Y") as started_at, 97180 as user_id, 84060 as account_id, 22076 as org_id, "nick" as name, 8275 as group_id, "all users" as group_name
    union all
    SELECT DATE_FORMAT( "Thu Jul 27 07:30:00 2023", "%a %b %d %H:%M:%S %Y") as started_at, 19429 as user_id, 17936 as account_id, 22076 as org_id, "jessica" as name, 8275 as group_id, "all users" as group_name
    union all
    SELECT DATE_FORMAT( "Thu Jul 27 07:30:00 2023", "%a %b %d %H:%M:%S %Y") as started_at, 19429 as user_id, 17936 as account_id, 22076 as org_id, "jessica" as name, 9251 as group_id, "YP" as group_name
    union all
    SELECT DATE_FORMAT( "Thu Jul 27 07:30:00 2023", "%a %b %d %H:%M:%S %Y") as started_at, 19429 as user_id, 17936 as account_id, 22076 as org_id, "jessica" as name, 10432 as group_id, "new york" as group_name
    union all
    SELECT DATE_FORMAT( "Thu Jul 27 07:30:00 2023", "%a %b %d %H:%M:%S %Y") as started_at, 19429 as user_id, 17936 as account_id, 22076 as org_id, "jessica" as name, 16451 as group_id, "test" as group_name
) data
      WHERE
      {% condition smartdrive.group_name_filter %} group_name {% endcondition %}
      and {% condition smartdrive.date_filter %} timestamp_add(started_at, interval 9 hour) {% endcondition %}
      GROUP BY
      1,2,3,4,5

      ;;
  }

  filter: group_name_filter {
    type: string
    suggest_explore: smartdrive_suggest
    suggest_dimension: smartdrive_suggest.group_name
  }

  filter: date_filter {
    type: date
  }

  dimension_group: started {
    type: time
    timeframes: [
      raw,
      time,
      time_of_day,
      date,
      hour_of_day,
      week,
      day_of_week,
      day_of_week_index,
      month,
      quarter,
      year
    ]
    sql: TIMESTAMP_ADD(${TABLE}.started_at, INTERVAL 9 HOUR);;
    group_label: "Datetime"
  }


  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}.account_id ;;
  }

  dimension: org_id {
    type: string
    sql: ${TABLE}.org_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: group_name {
    type: string
    sql: ${TABLE}.group_name ;;
  }

  dimension: group_id {
    type: string
    sql: ${TABLE}.group_id ;;
  }


  measure: cnt {
    type: number
  }

}
