#pragma GCC optimize("Ofast,unroll-loops")
#pragma GCC target("avx2,bmi,bmi2,abm,mmx,fma,sse4.2,popcnt,lzcnt")
#include <bits/stdc++.h>
#ifdef LOCAL
#include "/home/aeg/Documents/olimpiyat/templates/cpp-dump/dump.hpp"
#else
#define cpp_dump(...) void(0)
#endif
using namespace std;

#define int int64_t
#define PB push_back
#define F first
#define S second
#define I insert
#define P push
#define all(a) a.begin(), a.end()
#define sqr(a) ((a)*(a))

constexpr int MOD = 1e9+7;

void solve() {

}

int32_t main() {
	#ifdef LOCAL
	cpp_dump::log_label_func = cpp_dump::log_label::line(true);
	#else
	cin.tie(0)->sync_with_stdio(0);
	#endif
	int t;
	cin>>t;
	while(t--) solve();
}
