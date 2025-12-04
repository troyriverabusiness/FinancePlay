"""
Timeseries API routes - handles HTTP requests for timeseries data endpoints.
Routes call service layer methods for business logic.
"""

from fastapi import APIRouter, HTTPException
from fastapi.responses import StreamingResponse

from generated.models import InstrumentsInstrumentIdTimeseriesGetResponse
from services import timeseries as service

router = APIRouter(tags=["timeseries"])


@router.get(
    "/instruments/{instrument_id}/timeseries",
    response_model=InstrumentsInstrumentIdTimeseriesGetResponse,
)
def get_instrument_timeseries(
    instrument_id: str,
) -> InstrumentsInstrumentIdTimeseriesGetResponse:
    """
    Get historical timeseries data for a specific financial instrument.

    Args:
        instrument_id: Unique identifier of the financial instrument (e.g., "AAPL")

    Returns:
        InstrumentsInstrumentIdTimeseriesGetResponse containing instrumentId
        and array of timeseries data points
    """
    result = service.get_instrument_timeseries(instrument_id)
    if result is None:
        raise HTTPException(
            status_code=404,
            detail=f"Instrument with ID '{instrument_id}' not found",
        )
    return result


@router.get("/instruments/{instrument_id}/logo")
def get_instrument_logo(instrument_id: str):
    """
    Get the logo image for a specific financial instrument.

    Args:
        instrument_id: Unique identifier of the financial instrument (e.g., "AAPL")

    Returns:
        Image file (PNG, JPEG, or SVG format)
    """
    logo_bytes = service.get_instrument_logo(instrument_id)
    if logo_bytes is None:
        raise HTTPException(
            status_code=404, detail=f"Logo not found for instrument '{instrument_id}'"
        )

    # TODO: Detect media type based on image format and return appropriate content type
    # For now, returning as binary
    return StreamingResponse(iter([logo_bytes]), media_type="application/octet-stream")
    return result


@router.get("/instruments/{instrument_id}/logo")
def get_instrument_logo(instrument_id: str):
    """
    Get the logo image for a specific financial instrument.

    Args:
        instrument_id: Unique identifier of the financial instrument (e.g., "AAPL")

    Returns:
        Image file (PNG, JPEG, or SVG format)
    """
    logo_bytes = service.get_instrument_logo(instrument_id)
    if logo_bytes is None:
        raise HTTPException(
            status_code=404, detail=f"Logo not found for instrument '{instrument_id}'"
        )

    # TODO: Detect media type based on image format and return appropriate content type
    # For now, returning as binary
    return StreamingResponse(iter([logo_bytes]), media_type="application/octet-stream")
