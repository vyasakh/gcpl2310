view: smartdrive_suggest {
  derived_table: {
    sql:
      select 88902 as user_id, 77334 as account_id, 22076 as org_id, "ben" as name, 8275 as group_id, "all users" as group_name
      union all
      select 88902 as user_id, 77334 as account_id, 22076 as org_id, "ben" as name, 16452 as group_id, "test" as group_name
      union all
      select 88902 as user_id, 77334 as account_id, 22076 as org_id, "ben" as name, 29965 as group_id, "smartdrive" as group_name
      union all
      select 51181 as user_id, 46606 as account_id, 22076 as org_id, "jeff" as name, 8275 as group_id, "all users" as group_name
      union all
      select 51181 as user_id, 46606 as account_id, 22076 as org_id, "jeff" as name, 9251 as group_id, "YP" as group_name
      union all
      select 51181 as user_id, 46606 as account_id, 22076 as org_id, "jeff" as name, 16703 as group_id, "all users" as group_name
      union all
      select 51181 as user_id, 46606 as account_id, 22076 as org_id, "jeff" as name, 25353 as group_id, "tokyo" as group_name
      union all
      select 97176 as user_id, 84056 as account_id, 22076 as org_id, "thomas" as name, 8275 as group_id, "all users" as group_name
      union all
      select 97176 as user_id, 84056 as account_id, 22076 as org_id, "thomas" as name, 29965 as group_id, "smartdrive" as group_name
      union all
      select 19434 as user_id, 17941 as account_id, 22076 as org_id, "amber" as name, 8275 as group_id, "all users" as group_name
      union all
      select 19434 as user_id, 17941 as account_id, 22076 as org_id, "amber" as name, 16451 as group_id, "test" as group_name
      union all
      select 19442 as user_id, 17949 as account_id, 22076 as org_id, "joe" as name, 8275 as group_id, "all users" as group_name
      union all
      select 19442 as user_id, 17949 as account_id, 22076 as org_id, "joe" as name, 16451 as group_id, "test" as group_name
      union all
      select 97180 as user_id, 84060 as account_id, 22076 as org_id, "nick" as name, 8275 as group_id, "all users" as group_name
      union all
      select 19429 as user_id, 17936 as account_id, 22076 as org_id, "jessica" as name, 8275 as group_id, "all users" as group_name
      union all
      select 19429 as user_id, 17936 as account_id, 22076 as org_id, "jessica" as name, 9251 as group_id, "YP" as group_name
      union all
      select 19429 as user_id, 17936 as account_id, 22076 as org_id, "jessica" as name, 10432 as group_id, "new york" as group_name
      union all
      select 19429 as user_id, 17936 as account_id, 22076 as org_id, "jessica" as name, 16451 as group_id, "test" as group_name
      ;;

  }


  dimension: group_name {
    type:  string
    sql: ${TABLE}.group_name ;;
  }

}
