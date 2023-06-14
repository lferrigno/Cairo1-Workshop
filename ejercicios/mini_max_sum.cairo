// Ejercicio 1 - mini-max-sum ⭐ 
// https://www.hackerrank.com/challenges/mini-max-sum/problem

use array::ArrayTrait;
use debug::PrintTrait;

fn mini_max_sum(arr: Array<u128>) -> (u128, u128) {
  // TODO: Implementar el contenido de la funcion
    
    let mut min = 0;
    let mut max = 0;
    let mut sum = 0;
    let mut idx = 0;
    loop {
        if idx == arr.len() { // Si el indice es igual a la longitud del array
            break (); // Termina el loop
        }
        let num = *arr.at(idx);

        if idx == 0 {
            min = num
        }

        min = if (min<num){ min} else{ num};
        max = if (max>num) { max} else{ num};
        sum += num;
        idx += 1; // Incrementa el indice
    };
    (sum-max, sum-min)
}

// Correr los test usando 'cairo-test ./ejercicios/mini_max_sum.cairo'
#[cfg(test)]
mod tests {
    use array::ArrayTrait;
    use super::mini_max_sum;

    #[test]
    #[available_gas(200000)]
    fn sum_of_positive_numbers() {
        let mut arr = ArrayTrait::new();
        arr.append(1);
        arr.append(3);
        arr.append(5);
        arr.append(7);
        arr.append(9);
        let (min, max) = mini_max_sum(arr); 
        assert(min == 16, 'min should be 16');
        assert(max == 24, 'max should be 24');
    }

    #[test]
    #[available_gas(200000)]
    fn sum_of_numbers_asc() {
        let mut arr = ArrayTrait::new();
        arr.append(1);
        arr.append(2);
        arr.append(3);
        arr.append(4);
        arr.append(5);
        let (min, max) = mini_max_sum(arr); 
        assert(min == 10, 'min should be 10');
        assert(max == 14, 'max should be 14');
    }

    #[test]
    #[available_gas(200000)]
    fn sum_of_numbers_desc() {
        let mut arr = ArrayTrait::new();
        arr.append(5);
        arr.append(4);
        arr.append(3);
        arr.append(2);
        arr.append(1);
        let (min, max) = mini_max_sum(arr); 
        assert(min == 10, 'min should be 10');
        assert(max == 14, 'max should be 14');
    }

    #[test]
    #[available_gas(200000)]
    fn sum_of_zeros() {
        let mut arr = ArrayTrait::new();
        arr.append(0);
        arr.append(0);
        arr.append(0);
        arr.append(0);
        arr.append(0);
        let (min, max) = mini_max_sum(arr); 
        assert(min == 0, 'min should be 0');
        assert(max == 0, 'max should be 0');
    }
}
