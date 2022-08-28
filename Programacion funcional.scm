;------------------
;Taller ProFuncional
David Duarte
;------------------
;Primer punto
;------------------
(define id (lambda (num)
    num
  )
)

(define neg (lambda (num)
    (* -1 num)
  )
)

(define cuadrado (lambda (num) 
    (* num num)
  )
)

(define cubo (lambda (num) 
    (* (* num num) num)
  )
)

;----------------------------------------------------------------------------

;------------------
;Segundo punto
;------------------
(define evaluar-puntos (lambda (funcion lista)
    (if (null? lista)
      (list)
      (cons (list (car lista) (funcion (car lista))) (evaluar-puntos funcion (cdr lista)))
    )
  )
)
;----------------------------------------------------------------------------

;------------------
;Tercer punto
;------------------
(define es-creciente-en-punto? (lambda (funcion x)
    (if (<= (funcion (- x 1)) (funcion x)) 
      (if (> (funcion (+ x 1)) (funcion x))
        #t
        #f
      )
    #f
    )
  )   
)


;----------------------------------------------------------------------------

;------------------
;Cuarto punto
;------------------
(define es-decreciente-en-punto? (lambda (funcion x)
    (if (>= (funcion (- x 1)) (funcion x)) 
      (if (< (funcion (+ x 1)) (funcion x))
        #t
        #f
      )
    #f
    )
  )   
)

;----------------------------------------------------------------------------

;------------------
;Quinto punto
;------------------

(define es-creciente-en-muestra? (lambda (funcion lista)
    (apply es-creciente-en-punto? funcion lista)
  )
)
;----------------------------------------------------------------------------
;------------------
;Sexto punto
;------------------

(define es-decreciente-en-muestra? (lambda (funcion lista)
    (apply es-decreciente-en-punto? funcion lista)
  )
)
;----------------------------------------------------------------------------

;------------------
;Septimo punto
;------------------
(define es-monotona? (lambda (funcion lista)
  (if (or (apply es-creciente-en-punto? funcion lista) (apply es-decreciente-en-punto? funcion lista))
  #t #f
  )
  )
)
;----------------------------------------------------------------------------