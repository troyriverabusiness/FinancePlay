"""
Instruments API routes - handles HTTP requests for instrument endpoints.
Routes call service layer methods for business logic.
"""

from typing import Optional

from fastapi import APIRouter, HTTPException

from generated.models import InstrumentDetail, InstrumentsGetResponse, Type
from services import instruments as service

router = APIRouter(prefix="/instruments", tags=["instruments"])


@router.get("/", response_model=InstrumentsGetResponse)
def list_instruments(type: Optional[str] = None) -> InstrumentsGetResponse:
    """
    List all financial instruments.

    Optionally filter by instrument type (stock, crypto, forex, commodity, index).
    """
    return service.list_instruments(instrument_type=type)


@router.get("/{instrument_id}", response_model=InstrumentDetail)
def get_instrument_by_id(instrument_id: str) -> InstrumentDetail:
    """
    Get detailed information about a specific financial instrument.

    Args:
        instrument_id: Unique identifier of the financial instrument (e.g., "AAPL")

    Returns:
        InstrumentDetail object with full instrument information
    """
    result = service.get_instrument_by_id(instrument_id)
    if result is None:
        raise HTTPException(
            status_code=404, detail=f"Instrument with ID '{instrument_id}' not found"
        )
    return result
