with 

source as (

    select * from {{ source('staging', 'greentaxi_trips') }}

),

renamed as (

    select
        vendorid,
        tpep_pickup_datetime,
        tpep_dropoff_datetime,
        passenger_count,
        trip_distance,
        ratecodeid
        store_and_fwd_flag,
        pulocationid,
        dolocationid,
        payment_type,
        {{ get_payment_type_description('payment_type') }} as payment_type_described,
        fare_amount,
        extra,
        mta_tax,
        tip_amount,
        tolls_amount,
        ehail_fee,
        total_amount,
        congestion_surcharge
    from source

)

select * from renamed
