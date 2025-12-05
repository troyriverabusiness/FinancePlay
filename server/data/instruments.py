"""
Financial instrument definitions - Single source of truth for all instruments.

This module contains all instrument data as a list of dictionaries that can be
converted to Pydantic models (InstrumentDetail) in the service layer.
"""

import os
from typing import Optional

from dotenv import load_dotenv

from generated.models import Type

# Load environment variables from .env file (for local development)
# In Docker, environment variables are passed directly via docker-compose
load_dotenv()


def build_logo_url(symbol: str, is_crypto: bool = False) -> Optional[str]:
    """
    Build a logo URL for an instrument.
    
    Args:
        symbol: The instrument symbol (e.g., "AAPL", "BTC")
        is_crypto: Whether this is a cryptocurrency (uses /crypto/ endpoint)
    
    Returns:
        The logo URL if token is available, None otherwise
    """
    token = os.getenv("LOGO_DEV_API_KEY")
    if token is None:
        return None
    
    endpoint = "crypto" if is_crypto else "ticker"
    return f"https://img.logo.dev/{endpoint}/{symbol}?token={token}"

# All instruments available in the FinancePlay API
# Each entry contains full InstrumentDetail fields
INSTRUMENTS: list[dict] = [
    # =========================================================================
    # STOCKS (50) - Largest US companies by market cap
    # =========================================================================
    {
        "id": "AAPL",
        "symbol": "AAPL",
        "name": "Apple Inc.",
        "type": Type.stock,
        "exchange": "NASDAQ",
        "currency": "EUR",
        "description": None,
        "sector": "Technology",
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "MSFT",
        "symbol": "MSFT",
        "name": "Microsoft Corporation",
        "type": Type.stock,
        "exchange": "NASDAQ",
        "currency": "EUR",
        "description": None,
        "sector": "Technology",
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "GOOGL",
        "symbol": "GOOGL",
        "name": "Alphabet Inc.",
        "type": Type.stock,
        "exchange": "NASDAQ",
        "currency": "EUR",
        "description": None,
        "sector": "Technology",
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "AMZN",
        "symbol": "AMZN",
        "name": "Amazon.com Inc.",
        "type": Type.stock,
        "exchange": "NASDAQ",
        "currency": "EUR",
        "description": None,
        "sector": "Consumer Cyclical",
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "NVDA",
        "symbol": "NVDA",
        "name": "NVIDIA Corporation",
        "type": Type.stock,
        "exchange": "NASDAQ",
        "currency": "EUR",
        "description": None,
        "sector": "Technology",
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "META",
        "symbol": "META",
        "name": "Meta Platforms Inc.",
        "type": Type.stock,
        "exchange": "NASDAQ",
        "currency": "EUR",
        "description": None,
        "sector": "Technology",
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "TSLA",
        "symbol": "TSLA",
        "name": "Tesla Inc.",
        "type": Type.stock,
        "exchange": "NASDAQ",
        "currency": "EUR",
        "description": None,
        "sector": "Consumer Cyclical",
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "BRK.B",
        "symbol": "BRK.B",
        "name": "Berkshire Hathaway Inc.",
        "type": Type.stock,
        "exchange": "NYSE",
        "currency": "EUR",
        "description": None,
        "sector": "Financial Services",
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "UNH",
        "symbol": "UNH",
        "name": "UnitedHealth Group Inc.",
        "type": Type.stock,
        "exchange": "NYSE",
        "currency": "EUR",
        "description": None,
        "sector": "Healthcare",
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "JNJ",
        "symbol": "JNJ",
        "name": "Johnson & Johnson",
        "type": Type.stock,
        "exchange": "NYSE",
        "currency": "EUR",
        "description": None,
        "sector": "Healthcare",
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "V",
        "symbol": "V",
        "name": "Visa Inc.",
        "type": Type.stock,
        "exchange": "NYSE",
        "currency": "EUR",
        "description": None,
        "sector": "Financial Services",
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "XOM",
        "symbol": "XOM",
        "name": "Exxon Mobil Corporation",
        "type": Type.stock,
        "exchange": "NYSE",
        "currency": "EUR",
        "description": None,
        "sector": "Energy",
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "JPM",
        "symbol": "JPM",
        "name": "JPMorgan Chase & Co.",
        "type": Type.stock,
        "exchange": "NYSE",
        "currency": "EUR",
        "description": None,
        "sector": "Financial Services",
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "PG",
        "symbol": "PG",
        "name": "Procter & Gamble Co.",
        "type": Type.stock,
        "exchange": "NYSE",
        "currency": "EUR",
        "description": None,
        "sector": "Consumer Defensive",
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "MA",
        "symbol": "MA",
        "name": "Mastercard Inc.",
        "type": Type.stock,
        "exchange": "NYSE",
        "currency": "EUR",
        "description": None,
        "sector": "Financial Services",
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "HD",
        "symbol": "HD",
        "name": "The Home Depot Inc.",
        "type": Type.stock,
        "exchange": "NYSE",
        "currency": "EUR",
        "description": None,
        "sector": "Consumer Cyclical",
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "CVX",
        "symbol": "CVX",
        "name": "Chevron Corporation",
        "type": Type.stock,
        "exchange": "NYSE",
        "currency": "EUR",
        "description": None,
        "sector": "Energy",
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "MRK",
        "symbol": "MRK",
        "name": "Merck & Co. Inc.",
        "type": Type.stock,
        "exchange": "NYSE",
        "currency": "EUR",
        "description": None,
        "sector": "Healthcare",
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "ABBV",
        "symbol": "ABBV",
        "name": "AbbVie Inc.",
        "type": Type.stock,
        "exchange": "NYSE",
        "currency": "EUR",
        "description": None,
        "sector": "Healthcare",
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "LLY",
        "symbol": "LLY",
        "name": "Eli Lilly and Company",
        "type": Type.stock,
        "exchange": "NYSE",
        "currency": "EUR",
        "description": None,
        "sector": "Healthcare",
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "PEP",
        "symbol": "PEP",
        "name": "PepsiCo Inc.",
        "type": Type.stock,
        "exchange": "NASDAQ",
        "currency": "EUR",
        "description": None,
        "sector": "Consumer Defensive",
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "KO",
        "symbol": "KO",
        "name": "The Coca-Cola Company",
        "type": Type.stock,
        "exchange": "NYSE",
        "currency": "EUR",
        "description": None,
        "sector": "Consumer Defensive",
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "COST",
        "symbol": "COST",
        "name": "Costco Wholesale Corporation",
        "type": Type.stock,
        "exchange": "NASDAQ",
        "currency": "EUR",
        "description": None,
        "sector": "Consumer Defensive",
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "AVGO",
        "symbol": "AVGO",
        "name": "Broadcom Inc.",
        "type": Type.stock,
        "exchange": "NASDAQ",
        "currency": "EUR",
        "description": None,
        "sector": "Technology",
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "WMT",
        "symbol": "WMT",
        "name": "Walmart Inc.",
        "type": Type.stock,
        "exchange": "NYSE",
        "currency": "EUR",
        "description": None,
        "sector": "Consumer Defensive",
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "MCD",
        "symbol": "MCD",
        "name": "McDonald's Corporation",
        "type": Type.stock,
        "exchange": "NYSE",
        "currency": "EUR",
        "description": None,
        "sector": "Consumer Cyclical",
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "CSCO",
        "symbol": "CSCO",
        "name": "Cisco Systems Inc.",
        "type": Type.stock,
        "exchange": "NASDAQ",
        "currency": "EUR",
        "description": None,
        "sector": "Technology",
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "ACN",
        "symbol": "ACN",
        "name": "Accenture plc",
        "type": Type.stock,
        "exchange": "NYSE",
        "currency": "EUR",
        "description": None,
        "sector": "Technology",
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "TMO",
        "symbol": "TMO",
        "name": "Thermo Fisher Scientific Inc.",
        "type": Type.stock,
        "exchange": "NYSE",
        "currency": "EUR",
        "description": None,
        "sector": "Healthcare",
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "ABT",
        "symbol": "ABT",
        "name": "Abbott Laboratories",
        "type": Type.stock,
        "exchange": "NYSE",
        "currency": "EUR",
        "description": None,
        "sector": "Healthcare",
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "DHR",
        "symbol": "DHR",
        "name": "Danaher Corporation",
        "type": Type.stock,
        "exchange": "NYSE",
        "currency": "EUR",
        "description": None,
        "sector": "Healthcare",
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "VZ",
        "symbol": "VZ",
        "name": "Verizon Communications Inc.",
        "type": Type.stock,
        "exchange": "NYSE",
        "currency": "EUR",
        "description": None,
        "sector": "Communication Services",
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "ADBE",
        "symbol": "ADBE",
        "name": "Adobe Inc.",
        "type": Type.stock,
        "exchange": "NASDAQ",
        "currency": "EUR",
        "description": None,
        "sector": "Technology",
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "CRM",
        "symbol": "CRM",
        "name": "Salesforce Inc.",
        "type": Type.stock,
        "exchange": "NYSE",
        "currency": "EUR",
        "description": None,
        "sector": "Technology",
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "NKE",
        "symbol": "NKE",
        "name": "NIKE Inc.",
        "type": Type.stock,
        "exchange": "NYSE",
        "currency": "EUR",
        "description": None,
        "sector": "Consumer Cyclical",
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "CMCSA",
        "symbol": "CMCSA",
        "name": "Comcast Corporation",
        "type": Type.stock,
        "exchange": "NASDAQ",
        "currency": "EUR",
        "description": None,
        "sector": "Communication Services",
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "NEE",
        "symbol": "NEE",
        "name": "NextEra Energy Inc.",
        "type": Type.stock,
        "exchange": "NYSE",
        "currency": "EUR",
        "description": None,
        "sector": "Utilities",
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "INTC",
        "symbol": "INTC",
        "name": "Intel Corporation",
        "type": Type.stock,
        "exchange": "NASDAQ",
        "currency": "EUR",
        "description": None,
        "sector": "Technology",
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "PM",
        "symbol": "PM",
        "name": "Philip Morris International Inc.",
        "type": Type.stock,
        "exchange": "NYSE",
        "currency": "EUR",
        "description": None,
        "sector": "Consumer Defensive",
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "TXN",
        "symbol": "TXN",
        "name": "Texas Instruments Inc.",
        "type": Type.stock,
        "exchange": "NASDAQ",
        "currency": "EUR",
        "description": None,
        "sector": "Technology",
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "RTX",
        "symbol": "RTX",
        "name": "RTX Corporation",
        "type": Type.stock,
        "exchange": "NYSE",
        "currency": "EUR",
        "description": None,
        "sector": "Industrials",
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "HON",
        "symbol": "HON",
        "name": "Honeywell International Inc.",
        "type": Type.stock,
        "exchange": "NASDAQ",
        "currency": "EUR",
        "description": None,
        "sector": "Industrials",
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "QCOM",
        "symbol": "QCOM",
        "name": "QUALCOMM Inc.",
        "type": Type.stock,
        "exchange": "NASDAQ",
        "currency": "EUR",
        "description": None,
        "sector": "Technology",
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "UPS",
        "symbol": "UPS",
        "name": "United Parcel Service Inc.",
        "type": Type.stock,
        "exchange": "NYSE",
        "currency": "EUR",
        "description": None,
        "sector": "Industrials",
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "LOW",
        "symbol": "LOW",
        "name": "Lowe's Companies Inc.",
        "type": Type.stock,
        "exchange": "NYSE",
        "currency": "EUR",
        "description": None,
        "sector": "Consumer Cyclical",
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "IBM",
        "symbol": "IBM",
        "name": "International Business Machines Corporation",
        "type": Type.stock,
        "exchange": "NYSE",
        "currency": "EUR",
        "description": None,
        "sector": "Technology",
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "CAT",
        "symbol": "CAT",
        "name": "Caterpillar Inc.",
        "type": Type.stock,
        "exchange": "NYSE",
        "currency": "EUR",
        "description": None,
        "sector": "Industrials",
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "AMGN",
        "symbol": "AMGN",
        "name": "Amgen Inc.",
        "type": Type.stock,
        "exchange": "NASDAQ",
        "currency": "EUR",
        "description": None,
        "sector": "Healthcare",
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "BA",
        "symbol": "BA",
        "name": "The Boeing Company",
        "type": Type.stock,
        "exchange": "NYSE",
        "currency": "EUR",
        "description": None,
        "sector": "Industrials",
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "GE",
        "symbol": "GE",
        "name": "General Electric Company",
        "type": Type.stock,
        "exchange": "NYSE",
        "currency": "EUR",
        "description": None,
        "sector": "Industrials",
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    # =========================================================================
    # CRYPTO (10) - Largest cryptocurrencies by market cap
    # =========================================================================
    {
        "id": "BTC",
        "symbol": "BTC",
        "name": "Bitcoin",
        "type": Type.crypto,
        "exchange": None,
        "currency": "EUR",
        "description": None,
        "sector": None,
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "ETH",
        "symbol": "ETH",
        "name": "Ethereum",
        "type": Type.crypto,
        "exchange": None,
        "currency": "EUR",
        "description": None,
        "sector": None,
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "BNB",
        "symbol": "BNB",
        "name": "Binance Coin",
        "type": Type.crypto,
        "exchange": None,
        "currency": "EUR",
        "description": None,
        "sector": None,
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "XRP",
        "symbol": "XRP",
        "name": "Ripple",
        "type": Type.crypto,
        "exchange": None,
        "currency": "EUR",
        "description": None,
        "sector": None,
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "ADA",
        "symbol": "ADA",
        "name": "Cardano",
        "type": Type.crypto,
        "exchange": None,
        "currency": "EUR",
        "description": None,
        "sector": None,
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "SOL",
        "symbol": "SOL",
        "name": "Solana",
        "type": Type.crypto,
        "exchange": None,
        "currency": "EUR",
        "description": None,
        "sector": None,
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "DOGE",
        "symbol": "DOGE",
        "name": "Dogecoin",
        "type": Type.crypto,
        "exchange": None,
        "currency": "EUR",
        "description": None,
        "sector": None,
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "DOT",
        "symbol": "DOT",
        "name": "Polkadot",
        "type": Type.crypto,
        "exchange": None,
        "currency": "EUR",
        "description": None,
        "sector": None,
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "MATIC",
        "symbol": "MATIC",
        "name": "Polygon",
        "type": Type.crypto,
        "exchange": None,
        "currency": "EUR",
        "description": None,
        "sector": None,
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "LTC",
        "symbol": "LTC",
        "name": "Litecoin",
        "type": Type.crypto,
        "exchange": None,
        "currency": "EUR",
        "description": None,
        "sector": None,
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    # =========================================================================
    # COMMODITIES (2) - Gold and Silver
    # =========================================================================
    {
        "id": "GOLD",
        "symbol": "XAU",
        "name": "Gold",
        "type": Type.commodity,
        "exchange": None,
        "currency": "EUR",
        "description": None,
        "sector": "Precious Metals",
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
    {
        "id": "SILVER",
        "symbol": "XAG",
        "name": "Silver",
        "type": Type.commodity,
        "exchange": None,
        "currency": "EUR",
        "description": None,
        "sector": "Precious Metals",
        "marketCap": None,
        "logoUrl": None,  # Will be set by post-processing
    },
]

# Update logoUrl values using the helper function
for inst in INSTRUMENTS:
    is_crypto = inst["type"] == Type.crypto
    inst["logoUrl"] = build_logo_url(inst["id"], is_crypto=is_crypto)

# Create a lookup dictionary for O(1) access by ID
INSTRUMENTS_BY_ID: dict[str, dict] = {inst["id"]: inst for inst in INSTRUMENTS}
