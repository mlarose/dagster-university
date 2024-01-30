from dagster import ScheduleDefinition
from ..jobs import trip_update_job, trip_by_week_update_job

trip_update_schedule = ScheduleDefinition(
    job=trip_update_job,
    cron_schedule="0 0 5 * *"  # every 5th of the month at midnight
)

trip_by_week_update_schedule = ScheduleDefinition(
    job=trip_by_week_update_job,
    cron_schedule="0 0 * * 1"  # every Monday at midnight
)
