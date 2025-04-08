#!/bin/bash
start_date="2023-01-01 00:00:00"  # Ngày bắt đầu
seconds_per_commit=86400  # Mỗi commit cách nhau 1 ngày (hoặc tùy chỉnh)

git filter-repo --commit-callback '
  commit.new_committer_date = int("'"$(date -d "$start_date" +%s)"'") + (commit.original_id * '"$seconds_per_commit"')
  commit.new_author_date = commit.new_committer_date
'

