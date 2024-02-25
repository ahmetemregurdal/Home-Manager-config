#pragma GCC optimize("Ofast,no-stack-protector,unroll-loops")
#pragma GCC target("avx2,bmi,bmi2,abm,mmx,fma,sse4.2,popcnt,lzcnt")
#include <bits/stdc++.h>
#include <ext/pb_ds/tree_policy.hpp>
#include <ext/pb_ds/assoc_container.hpp>
#include <ext/pb_ds/priority_queue.hpp>
#ifdef LOCAL
#include "/home/aeg/Documents/olimpiyat/templates/cpp-dump/dump.hpp"
#else
#define cpp_dump(...) void(0)
#endif
using namespace std;

random_device rd;
mt19937_64 rng(rd.entropy() != 0 ? rd() : chrono::high_resolution_clock::now().time_since_epoch().count());
typedef int64_t ll;
typedef uint64_t ull;
typedef uint32_t uint;
typedef long double ld;
#define PB push_back
#define F first
#define S second
#define I insert
#define P push
#define all(a) a.begin(), a.end()
template<typename T> inline T sqr(T const& a) { return a*a; }
constexpr uint MOD = 1e9+7;
constexpr uint mod = 998244353;
constexpr ld PI = 3.14159265358979323846264; // PI 23 decimal digit
struct chash {
	static constexpr ll C = ll(2e18 * PI) + 23;
	const ll RANDOM = rng();
	const ll B = uniform_int_distribution<ll>(0, MOD - 1)(rng);
	const ll b = uniform_int_distribution<ll>(0, mod - 1)(rng);
	template <typename T1, typename T2> inline size_t operator()(pair<T1, T2> const& x) const;
	template <typename T, enable_if_t<is_integral<T>::value, bool> = true>
	inline size_t operator()(T const& x) const {
		return __builtin_bswap64((ll(x)^RANDOM)*C);
	}
	inline size_t operator()(string const& x) const {
		ll curb = 1, curB = 1, curh = 0, curH = 0;
		for(int i=0; i<x.size(); i++) {
			curh += (curb * this->operator()(x[i])) % mod;
			curH += (curB * this->operator()(x[i])) % MOD;
			curh %= mod;
			curH %= MOD;
			curb = (curb * b) % mod;
			curB = (curB * B) % MOD;
		}
		size_t hash = ll(uint(curh)) + (ll(uint(curH))<<32);
		return this->operator()(hash);
	}
};
template <typename T1, typename T2> inline size_t chash::operator()(pair<T1, T2> const& x) const {
	return this->operator()((this->operator()(x.F) % MOD + ((this->operator()(x.S) % MOD) * B) % MOD) % MOD);
}
template <typename T, typename compfn = less<T>> using ordered_set = __gnu_pbds::tree<T, __gnu_pbds::null_type, compfn, __gnu_pbds::rb_tree_tag, __gnu_pbds::tree_order_statistics_node_update>;
template <typename T1, typename T2> using cmap = __gnu_pbds::gp_hash_table<T1, T2, chash>;
template <typename T, typename compfn = less<T>> using cpq = __gnu_pbds::priority_queue<T, compfn, __gnu_pbds::rc_binomial_heap_tag>;
template <typename T> using cset = unordered_set<T, chash>;

int main() {
	#ifdef LOCAL
	cpp_dump::log_label_func = cpp_dump::log_label::line(true);
	#else
	cin.tie(0)->sync_with_stdio(0);
	#endif
}
