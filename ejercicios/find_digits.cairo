// Ejercicio 2 - find-digits ⭐ 
// https://www.hackerrank.com/challenges/find-digits/problem

fn find_digits(n: u128) -> u128 {
    // TODO: Implementar el contenido de la funcion
    let mut digit = 0;
    let mut div = n;
    let mut res = 0;
    loop{
        if div==0 {
            break();
        }
    digit = div%10;
    if (digit != 0) && (n%digit == 0) {res+=1;}
    div = div/10;
    };
    res
}

// Correr los tests usando 'cairo-test ./ejercicios/find_digits.cairo'
#[cfg(test)]
mod tests {
    use super::find_digits;
    
    #[test]
    #[available_gas(200000)]
    fn find_digits_happy_path() {
        assert(find_digits(24) == 2, 'error find_digits_happy_path');
    } 

    #[test]
    #[available_gas(200000)]
    fn find_digits_zero_digit() {
        assert(find_digits(10) == 1, 'error find_digits_zero_digit');
    }

    #[test]
    #[available_gas(200000)]
    fn find_digits_single_digit() {
        assert(find_digits(7) == 1, 'error find_digits_single_digit');
    }

    #[test]
    #[available_gas(200000)]
    fn find_digits_zero_number() {
        assert(find_digits(0) == 0, 'error find_digits_zero_number');
    }

    #[test]
    #[available_gas(200000)]
    fn find_digits_same_digits() {
        assert(find_digits(1111) == 4, 'error find_digits_same_digits');
    }
}
