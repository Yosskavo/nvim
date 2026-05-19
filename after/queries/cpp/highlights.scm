(
  (call_expression
    function: (field_expression
      field: (field_identifier) @function.method.call
    )
  )
  (#set! priority 250)
)
(
  (call_expression
    function: (identifier) @function.call
  )
  ;; Only apply this if it is NOT a known type/constructor initialization
  (#set! priority 150)
)
