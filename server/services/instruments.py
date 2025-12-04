"""
Instruments service layer - contains business logic for instrument operations.
This is where you implement database queries, data processing, etc.
"""

from typing import Optional

from generated.models import (
    InstrumentDetail,
    InstrumentSummary,
    InstrumentsGetResponse,
    Type,
)


def list_instruments(type: Optional[str] = None) -> InstrumentsGetResponse:
    """
    List all financial instruments, optionally filtered by type.

    Args:
        type: Optional instrument type to filter by (stock, crypto, forex, commodity, index)

    Returns:
        InstrumentsGetResponse with 'data' key containing list of InstrumentSummary objects
    """
    # TODO: Implement database query to fetch instruments
    # Example return structure based on your OpenAPI spec:
    # return InstrumentsGetResponse(
    #     data=[
    #         InstrumentSummary(
    #             id="AAPL",
    #             symbol="AAPL",
    #             name="Apple Inc.",
    #             type=Type.stock,
    #             exchange="NASDAQ"
    #         )
    #     ]
    # )
    return InstrumentsGetResponse(data=[])


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
    # TODO: Implement database query to fetch instrument details
    # Return None if not found, HTTPException will be raised in router
    # Example return:
    # return InstrumentDetail(
    #     id="AAPL",
    #     symbol="AAPL",
    #     name="Apple Inc.",
    #     type=Type.stock,
    #     exchange="NASDAQ",
    #     currency="USD",
    #     description="Apple Inc. designs, manufactures, and markets smartphones...",
    #     sector="Technology",
    #     marketCap=3000000000000,
    #     logoUrl="/instruments/AAPL/logo"
    # )
    return None
