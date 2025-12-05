"""
Service for fetching data from the Alpha Vantage API.
"""

import os
import requests
from dotenv import load_dotenv

from data.instruments import INSTRUMENTS
from data.timeseries_cache import TIMESERIES_CACHE

load_dotenv()

ALPHA_VANTAGE_API_KEY = os.getenv("ALPHA_VANTAGE_API_KEY")
ALPHA_VANTAGE_BASE_URL = "https://www.alphavantage.co/query"


def fetch_intraday_time_series(symbol: str) -> dict:
    """
    Fetches intraday time series data for a given stock symbol.
    """
    params = {
        "function": "TIME_SERIES_INTRADAY",
        "symbol": symbol,
        "interval": "5min",
        "apikey": ALPHA_VANTAGE_API_KEY,
    }
    response = requests.get(ALPHA_VANTAGE_BASE_URL, params=params)
    response.raise_for_status()
    return response.json()


def refresh_timeseries_cache():
    """
    Refreshes the in-memory timeseries cache for all stocks.
    """
    print("Refreshing timeseries cache...")
    for instrument in INSTRUMENTS:
        if instrument.get("type") == "stock":
            symbol = instrument["symbol"]
            try:
                print(f"Fetching data for {symbol}...")
                data = fetch_intraday_time_series(symbol)
                if "Time Series (5min)" in data:
                    TIMESERIES_CACHE[symbol] = data
                    print(f"Successfully fetched and cached data for {symbol}")
                else:
                    print(f"No time series data found for {symbol}: {data}")
            except requests.exceptions.RequestException as e:
                print(f"Failed to fetch data for {symbol}: {e}")
            except Exception as e:
                print(f"An unexpected error occurred for {symbol}: {e}")
    print("Timeseries cache refresh complete.")
