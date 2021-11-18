

  create or replace view `dataline-integration-testing`._airbyte_test_normalization.`conflict_stream_name_conflict_stream_name_ab1`
  OPTIONS()
  as 
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_conflict_stream_name_hashid,
    
        json_extract(table_alias.conflict_stream_name, "$['conflict_stream_name']")
     as conflict_stream_name,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    CURRENT_TIMESTAMP() as _airbyte_normalized_at
from `dataline-integration-testing`.test_normalization.`conflict_stream_name` as table_alias
-- conflict_stream_name at conflict_stream_name/conflict_stream_name
where 1 = 1
and conflict_stream_name is not null;
