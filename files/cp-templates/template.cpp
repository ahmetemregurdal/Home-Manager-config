#pragma GCC optimize("Ofast,no-stack-protector,unroll-loops")
#pragma GCC target("avx2,bmi,bmi2,abm,mmx,fma,sse4.2,popcnt,lzcnt")
#include <bits/extc++.h>
#ifdef LOCAL
#include "/home/aeg/Documents/olimpiyat/templates/cpp-dump/dump.hpp"
#else
#define cpp_dump(...) void(0)
#endif
using namespace std;

typedef uint16_t ush;
typedef int64_t ll;
typedef uint64_t ull;
typedef uint32_t uint;
typedef float f;
typedef long double ld;
typedef double d;
#define PB push_back
#define F first
#define S second
#define I insert
#define P push
#define all(a) a.begin(), a.end()
#define iterative __attribute__((always_inline))
template<typename T> iterative inline T sqr(T const& a) { return a*a; }
typedef int v8si __attribute__((vector_size(32)));
typedef uint v8ui __attribute__((vector_size(32)));
typedef ll v4sl __attribute__((vector_size(32)));
typedef ull v4ul __attribute__((vector_size(32)));
typedef f v8f __attribute__((vector_size(32)));
typedef d v4d __attribute__((vector_size(32)));
typedef ld v2ld __attribute__((vector_size(32)));
typedef short v16ss __attribute__((vector_size(32)));
typedef ush v16us __attribute__((vector_size(32)));
template <typename T> struct has_vec_attr:false_type {};
template <> struct has_vec_attr<v8si>:true_type {};
template <> struct has_vec_attr<v8ui>:true_type {};
template <> struct has_vec_attr<v4sl>:true_type {};
template <> struct has_vec_attr<v4ul>:true_type {};
template <> struct has_vec_attr<v8f>:true_type {};
template <> struct has_vec_attr<v4d>:true_type {};
template <> struct has_vec_attr<v2ld>:true_type {};
template <> struct has_vec_attr<v16ss>:true_type {};
template <> struct has_vec_attr<v16us>:true_type {};
template <int T> struct int_type { static constexpr int value = T; };
template <typename T> struct vec_member_count:int_type<-1> {};
template <> struct vec_member_count<v8si>:int_type<8> {};
template <> struct vec_member_count<v8ui>:int_type<8> {};
template <> struct vec_member_count<v4sl>:int_type<4> {};
template <> struct vec_member_count<v4ul>:int_type<4> {};
template <> struct vec_member_count<v8f>:int_type<8> {};
template <> struct vec_member_count<v4d>:int_type<4> {};
template <> struct vec_member_count<v2ld>:int_type<2> {};
template <> struct vec_member_count<v16ss>:int_type<16> {};
template <> struct vec_member_count<v16us>:int_type<16> {};
constexpr uint MOD = 1e9+7;
template <typename T, enable_if_t<(!is_floating_point<T>::value)&&(!has_vec_attr<T>::value), bool> = true>
iterative inline T binpow(T a, ull b) {
	T ret = 1;
	while(b) {
		if(b&1) ret *= a;
		a *= a;
		b >>= 1;
	}
	return ret;
}
template <typename T, enable_if_t<is_floating_point<T>::value && (!has_vec_attr<T>::value), bool> = true>
T binpow(T const& a, ull const& b) {
	if(b==0) return 1;
	return sqr(fastpow(a, b/2))*((b%2==1)?a:1);
}
template <typename T, enable_if_t<(!is_floating_point<T>::value) && (!has_vec_attr<T>::value), bool> = true>
iterative inline T binpow(T a, ull b, int const& mod) {
	T ret = 1;
	while(b) {
		if(b&1) {
			ret *= a;
			ret %= mod;
		}
		a *= a;
		a %= mod;
		b>>=1;
	}
	return ret;
}
template <typename T, enable_if_t<has_vec_attr<T>::value && (!is_floating_point<T>::value), bool> = true> 
iterative inline T binpow(T a, ull b) {
	T ret;
	for(int i=0; i<vec_member_count<T>::value; i++) ret[i] = 1;
	while(b) {
		if(b&1) ret *= a;
		a *= a;
		b >>= 1;
	}
	return ret;
}
template <typename T, enable_if_t<(!is_floating_point<T>::value) && has_vec_attr<T>::value, bool> = true>
iterative inline T binpow(T a, ull b, int const& mod) {
	T ret;
	for(int i=0; i<vec_member_count<T>::value; i++) ret[i] = 1;
	while(b) {
		if(b&1) {
			ret *= a;
			ret %= mod;
		}
		a *= a;
		a %= mod;
		b>>=1;
	}
	return ret;
}
template <uint mod = MOD> struct mint{
	uint value;
	iterative inline mint(uint a = 0):value(a) {}
	iterative inline bool operator<(mint const& rhs) const {return this->value < rhs.value;}
	iterative inline bool operator>(mint const& rhs) const {return this->value > rhs.value;}
	iterative inline bool operator<=(mint const& rhs) const {return this->value <= rhs.value;}
	iterative inline bool operator>=(mint const& rhs) const {return this->value >= rhs.value;}
	iterative inline bool operator==(mint const& rhs) const {return this->value == rhs.value;}
	iterative inline bool operator!=(mint const& rhs) const {return this->value != rhs.value;}
	iterative inline mint operator+(mint const& rhs) const{
		uint ret = this->value + rhs.value;
		if(ret > mod) ret -= mod;
		return mint(ret);
	}
	iterative inline mint operator-(mint const& rhs) const {
		if(this->value < rhs.value)
			return mint(this->value + (mod - rhs.value));
		else return mint(this->value - rhs.value);
	}
	iterative inline mint operator*(mint const& rhs) const {
		ull ret = 1ll * this->value * rhs.value;
		return mint(ret % mod);
	}
	iterative inline mint reverse() const {
		return mint(binpow(value, mod - 2, mod));
	}
	iterative inline mint operator/(mint const& rhs) const {
		return this->operator*(reverse(rhs));
	}
	friend iterative inline mint binpow(mint const& a, ull const& b) {
		return mint(binpow(a.value, b, mod));
	}
};
template <typename T, typename compfn = less<T>> using ordered_set = __gnu_pbds::tree<T, __gnu_pbds::null_type, compfn, __gnu_pbds::rb_tree_tag, __gnu_pbds::tree_order_statistics_node_update>;

int main() {
	#ifdef LOCAL
	cpp_dump::log_label_func = cpp_dump::log_label::line(true);
	#else
	cin.tie(0)->sync_with_stdio(0);
	#endif
}
