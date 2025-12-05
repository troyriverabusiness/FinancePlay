"""
In-memory cache for timeseries data.

This module provides a simple in-memory cache for storing and retrieving
timeseries data. The data is stored in a dictionary where the keys are
instrument symbols and the values are the timeseries data.

The cache is populated by the cron job in `server/cron/fetch_data.py`.
"""

from typing import Any, Dict

# In-memory cache for timeseries data
TIMESERIES_CACHE: Dict[str, Any] = {}
