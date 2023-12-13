using LinearAlgebra
"""
Approximation de la solution du problème 

    min qₖ(s) = s'gₖ + 1/2 s' Hₖ s, sous la contrainte ‖s‖ ≤ Δₖ

# Syntaxe

    s = gct(g, H, Δ; kwargs...)

# Entrées

    - g : (Vector{<:Real}) le vecteur gₖ
    - H : (Matrix{<:Real}) la matrice Hₖ
    - Δ : (Real) le scalaire Δₖ
    - kwargs  : les options sous formes d'arguments "keywords", c'est-à-dire des arguments nommés
        • max_iter : le nombre maximal d'iterations (optionnel, par défaut 100)
        • tol_abs  : la tolérence absolue (optionnel, par défaut 1e-10)
        • tol_rel  : la tolérence relative (optionnel, par défaut 1e-8)

# Sorties

    - s : (Vector{<:Real}) une approximation de la solution du problème

# Exemple d'appel

    g = [0; 0]
    H = [7 0 ; 0 2]
    Δ = 1
    s = gct(g, H, Δ)

"""
function gct(g::Vector{<:Real}, H::Matrix{<:Real}, Δ::Real; 
    max_iter::Integer = 100, 
    tol_abs::Real = 1e-10, 
    tol_rel::Real = 1e-8)

    j = 0
    g₀ = g
    s = zeros(length(g))
    p = -g

    while ( j < max_iter && norm(g) > max(norm(g₀)*tol_rel, tol_abs) )
        κ = p' * H * p
        if κ <= 0
            a = norm(p)^2
            b = 2*s'*p
            c = norm(s)^2 - Δ^2
            discriminant = b*b - 4*a*c
            r₁ = (-b - sqrt(discriminant))/(2*a)
            r₂ = (-b + sqrt(discriminant))/(2*a)

            q₁ = g'*(s+r₁*p) + 1/2 * (s+r₁*p)' * H * (s+r₁*p)
            q₂ = g'*(s+r₂*p) + 1/2 * (s+r₂*p)' * H * (s+r₂*p)

            if q₁ < q₂ 
                σ = r₁
            else
                σ = r₂
            end

            return s + σ * p
        end

        α = g' * g/κ 
        
        if norm(s + α * p) >= Δ
            a = norm(p)^2
            b = 2*s'*p
            c = norm(s)^2 - Δ^2
            discriminant = b*b - 4*a*c
            r₂ = (-b + sqrt(discriminant))/(2*a)
            σ = r₂
            return s + σ * p
        end

        s = s + α*p
        oldg = g
        g = g + α*H*p
        β = (g'*g)/(oldg'*oldg)
        p = -g + β * p
        j = j + 1
    end
   return s
end
