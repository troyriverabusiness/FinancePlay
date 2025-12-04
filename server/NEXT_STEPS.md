# Next Steps - Implementation Tasks

## What's Done ✓

Your FastAPI server skeleton is complete with:
- OpenAPI spec as source of truth
- Auto-generated Pydantic models
- Route handlers that call service layer
- Clean architecture ready for business logic

## What You Need to Implement

### 1. Database Setup (Not Started)
- Choose your database (PostgreSQL, MongoDB, SQLite, etc.)
- Set up connection pooling
- Create tables/schemas for instruments and timeseries data

### 2. services/instruments.py

```python
# TODO: Implement these functions

def list_instruments(type: Optional[str] = None) -> InstrumentsGetResponse:
    """
    Query database for instruments, optionally filtered by type.
    
    Current status: Returns empty list
    TODO:
    - Connect to database
    - Query instruments table
    - Filter by type if provided
    - Return InstrumentsGetResponse with data
    """
    pass

def get_instrument_by_id(instrument_id: str) -> Optional[InstrumentDetail]:
    """
    Query database for a single instrument by ID.
    
    Current status: Returns None
    TODO:
    - Connect to database
    - Query instruments table by ID
    - Fetch related fields (currency, marketCap, sector, etc.)
    - Return InstrumentDetail or None if not found
    """
    pass
```

### 3. services/timeseries.py

```python
# TODO: Implement these functions

def get_instrument_timeseries(
    instrument_id: str,
) -> Optional[InstrumentsInstrumentIdTimeseriesGetResponse]:
    """
    Query database for timeseries data of an instrument.
    
    Current status: Returns None
    TODO:
    - Connect to database
    - Query timeseries_data table
    - Filter by instrument_id
    - Order by timestamp (most recent last or first?)
    - Pagination considerations?
    - Return response or None if not found
    """
    pass

def get_instrument_logo(instrument_id: str) -> Optional[bytes]:
    """
    Retrieve logo image for an instrument.
    
    Current status: Returns None
    TODO:
    - Determine logo storage (filesystem, S3, database blob?)
    - Query logo location for instrument_id
    - Read and return image bytes
    - Handle missing logos gracefully
    """
    pass
```

## Implementation Priority

1. **HIGH** - `list_instruments()` and `get_instrument_by_id()`
   - Core functionality for instrument discovery
   
2. **HIGH** - `get_instrument_timeseries()`
   - Core functionality for timeseries data
   
3. **MEDIUM** - `get_instrument_logo()`
   - Nice-to-have but blocks logo endpoint
   - Consider if this is required

## Testing Your Implementation

Once you implement a service function:

```bash
# 1. Start server
docker-compose up

# 2. Test with curl
curl http://localhost:8000/instruments

# 3. Or use interactive docs
# Open http://localhost:8000/docs in browser
```

## Important Notes

- **Don't edit routers/** - They're already complete!
- **Don't edit generated/models.py** - It's auto-generated
- **Only edit services/** - This is where your logic goes
- **Router imports from services** - No changes needed

## When You Update the API

```bash
# 1. Update openapi.yaml
# 2. Run generation script
./generate.sh

# 3. Models auto-update
# 4. Routers automatically match new spec
# 5. You might need to update services to match new fields
```

## Type Hints Reference

Models imported from `generated.models`:

```python
from generated.models import (
    Type,                                          # Enum: stock, crypto, forex, commodity, index
    InstrumentSummary,                            # id, symbol, name, type, exchange (optional)
    InstrumentDetail,                             # + currency, description, sector, marketCap, logoUrl
    TimeseriesDataPoint,                          # timestamp, open, high, low, close, volume, adjustedClose
    InstrumentsGetResponse,                       # { data: List[InstrumentSummary] }
    InstrumentsInstrumentIdTimeseriesGetResponse, # { instrumentId: str, data: List[TimeseriesDataPoint] }
    Error,                                        # error, message, details
)
```

## Example Implementation Skeleton

```python
# services/instruments.py

from typing import Optional
from generated.models import InstrumentDetail, InstrumentSummary, InstrumentsGetResponse, Type
from your_database import get_db

def list_instruments(type: Optional[str] = None) -> InstrumentsGetResponse:
    db = get_db()
    query = db.instruments.find()
    
    if type:
        query = query.filter(type=type)
    
    instruments = [
        InstrumentSummary(
            id=doc['id'],
            symbol=doc['symbol'],
            name=doc['name'],
            type=Type[doc['type']],
            exchange=doc.get('exchange'),
        )
        for doc in query
    ]
    
    return InstrumentsGetResponse(data=instruments)
```

## Questions?

If something isn't clear, check:
1. `openapi.yaml` - API contract
2. `generated/models.py` - Available Pydantic models
3. `routers/instruments.py` and `routers/timeseries.py` - How routes work
4. `IMPLEMENTATION_SUMMARY.md` - Full architecture details
