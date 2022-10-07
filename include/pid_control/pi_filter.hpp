/*
 * pid_control
 *  
 * MIT License
 * 
 * Copyright (c) 2022 cinaral
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to
 * use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
 * of the Software, and to permit persons to whom the Software is furnished to do
 * so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

#ifndef PI_FILTER_HPP_CINARAL_220925_0349
#define PI_FILTER_HPP_CINARAL_220925_0349

#include "types.hpp"

namespace pid_control
{
//* Proportional-Integral filter
//*
//* PI(s) = K_p + K_i s
//*
//* x -> PI(s) -> y
// template <uint_t Y_DIM>
// void
// PI(const real_t T_s, const real_t K_p[], const real_t K_i[], const real_t x[], const real_t x_next[], const
// real_t y[],
//    real_t y_next[])
//{
//	constexpr real_t coef_y = -1.;

//	for (uint_t i = 0; i < Y_DIM; ++i) {
//		const real_t coef_x = -K_p[i] + .5 * K_i[i] * T_s;
//		const real_t coef_x_next = K_p[i] + .5 * K_i[i] * T_s;

//		y_next[i] = coef_x * x[i] + coef_x_next * x_next[i] - coef_y * y[i];
//	}
//}
} // namespace pid_control

#endif