"""
Cron job for fetching timeseries data from Alpha Vantage.
"""

import time
import schedule
from services.alpha_vantage import refresh_timeseries_cache


def main():
    """
    Main function to schedule and run the cron job.
    """
    print("Starting cron job...")
    # Run once at the start
    refresh_timeseries_cache()

    # Schedule the job to run every 12 hours
    schedule.every(12).hours.do(refresh_timeseries_cache)

    while True:
        schedule.run_pending()
        time.sleep(1)


if __name__ == "__main__":
    main()
