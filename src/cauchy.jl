    using LinearAlgebra
"""
Approximation de la solution du problème 

    min qₖ(s) = s'gₖ + 1/2 s' Hₖ s

        sous les contraintes s = -t gₖ, t > 0, ‖s‖ ≤ Δₖ

# Syntaxe

    s = cauchy(g, H, Δ; kwargs...)

# Entrées

    - g : (Vector{<:Real}) le vecteur gₖ
    - H : (Matrix{<:Real}) la matrice Hₖ
    - Δ : (Real) le scalaire Δₖ
    - kwargs  : les options sous formes d'arguments "keywords", c'est-à-dire des arguments nommés
        • tol_abs  : la tolérence absolue (optionnel, par défaut 1e-10)

# Sorties

    - s : (Vector{<:Real}) la solution du problème

# Exemple d'appel

    g = [0; 0]
    H = [7 0 ; 0 2]
    Δ = 1
    s = cauchy(g, H, Δ)

"""
function cauchy(g::Vector{<:Real}, H::Matrix{<:Real}, Δ::Real; tol_abs::Real = 1e-10)

    s = zeros(length(g))

    a = g' * H * g
    
    b = -norm(g)^2
    
    t = -b/a

    borne_max = Δ / norm(g)

    if norm(g) ≈ 0 atol=tol_abs
        t = 0
    else
        if a > 0
            if t > borne_max
                t = borne_max
            elseif t < 0
                t = 0
            end
        elseif 1/2 * a *  borne_max^2 + b * borne_max > 0
            t = 0
        else 
            t = borne_max 
        end
    end
    
    s = -t*g

    return s
end
