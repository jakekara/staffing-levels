import pandas as pd

CACHED_CPI_TABLE = None

def get_cpi_table():
    
    global CACHED_CPI_TABLE
    
    if CACHED_CPI_TABLE is not None:
        return CACHED_CPI_TABLE
    
    print ("Fetching")
    
    ret = pd.read_html(
        "https://www.usinflationcalculator.com/inflation/consumer-price-index-and-annual-percent-changes-from-1913-to-2008/",
        skiprows=2
    )
    
    valid_years = range(1913,2018)
    
    ret = ret[0]

    ret = ret[[0,13]]
    
    ret.columns = ["year","average"]
    
    ret = ret.set_index("year")
    
    # cache it
    ret.to_csv("output/cpi-table.csv")
    
    CACHED_CPI_TABLE = ret
    
    return ret

def adjust(money_from, year_from, year_to):
    
    cpi_table = get_cpi_table()
    
    top = cpi_table.loc[year_to]["average"]
    bottom = cpi_table.loc[year_from]["average"]
    
    ratio = top / bottom
    
    return ratio * money_from

