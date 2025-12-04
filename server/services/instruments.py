"""
Instruments service layer - contains business logic for instrument operations.
This is where you implement database queries, data processing, etc.
"""

from typing import Optional

from data.instruments import INSTRUMENTS, INSTRUMENTS_BY_ID
from generated.models import (
    InstrumentDetail,
    InstrumentSummary,
    InstrumentsGetResponse,
    Type,
)


def list_instruments(instrument_type: Optional[str] = None) -> InstrumentsGetResponse:
    """
    List all financial instruments, optionally filtered by type.

    Args:
        instrument_type: Optional instrument type to filter by (stock, crypto, forex, commodity, index)

    Returns:
        InstrumentsGetResponse with 'data' key containing list of InstrumentSummary objects
    """
    instruments = INSTRUMENTS

    # Filter by type if provided
    if instrument_type is not None:
        try:
            type_enum = Type(instrument_type)
            instruments = [inst for inst in instruments if inst["type"] == type_enum]
        except ValueError:
            # Invalid type provided, return empty list
            return InstrumentsGetResponse(data=[])

    # Convert to InstrumentSummary objects
    summaries = [
        InstrumentSummary(
            id=inst["id"],
            symbol=inst["symbol"],
            name=inst["name"],
            type=inst["type"],
            exchange=inst["exchange"],
        )
        for inst in instruments
    ]

    return InstrumentsGetResponse(data=summaries)


def get_instrument_by_id(instrument_id: str) -> Optional[InstrumentDetail]:
    """
    Get detailed information about a specific financial instrument.

    Args:
        instrument_id: Unique identifier of the financial instrument (e.g., "AAPL")

    Returns:
        InstrumentDetail object with full instrument information, or None if not found

    Raises:
        HTTPException(404): If instrument is not found (handled in router)
    """
    inst = INSTRUMENTS_BY_ID.get(instrument_id)

    if inst is None:
        return None

    return InstrumentDetail(
        id=inst["id"],
        symbol=inst["symbol"],
        name=inst["name"],
        type=inst["type"],
        exchange=inst["exchange"],
        currency=inst["currency"],
        description=inst["description"],
        sector=inst["sector"],
        marketCap=inst["marketCap"],
        logoUrl=inst["logoUrl"],
    )
