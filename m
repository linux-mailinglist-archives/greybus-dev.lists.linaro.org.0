Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CDD4C6CB9
	for <lists+greybus-dev@lfdr.de>; Mon, 28 Feb 2022 13:37:14 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 117303EF14
	for <lists+greybus-dev@lfdr.de>; Mon, 28 Feb 2022 12:37:14 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by lists.linaro.org (Postfix) with ESMTPS id 0B26C3EB82
	for <greybus-dev@lists.linaro.org>; Mon, 28 Feb 2022 12:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646051832; x=1677587832;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=7B5xXQQ6ggh1HFTcP+YadDpRzLVifOjGsC04RK4u89s=;
  b=W+CO14QlVf4uvWOaNIBzpEf5NQDFGQScuS/0z1kEFZ7cMbizKvSqIbqY
   5rAJdEMWMr5UkTyKzt6w1L4Jgh3JIeHRRrC5WhieDSg30vUypBx/QKZSr
   uC7rLGAvvourG4puGDauqNy/qd8YyyDV57BWgMl6X0aWvwpEbFFac7VmO
   f7jIBelmMMQkcAaQ77rQchK8CtAsda/h1Xp0g92S4cjZkUU/gu6D75Sf+
   IiOoGUeOAURp/+uv+lbTezxMR/sJFzX99KeZavEnz6tImOAdgI43NW651
   NoKqglU3nI0+XBoJg/V+ZM5XOY05tosHOWOs9GSPiXYmpuTxfkKfxj1k8
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="250453221"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="250453221"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2022 04:37:10 -0800
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="550218755"
Received: from gkapusti-mobl.ccr.corp.intel.com (HELO localhost) ([10.252.51.8])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2022 04:37:04 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>, linux-kbuild@vger.kernel.org
In-Reply-To: <20220228103142.3301082-1-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220228103142.3301082-1-arnd@kernel.org>
Date: Mon, 28 Feb 2022 14:36:52 +0200
Message-ID: <87v8wz5frv.fsf@intel.com>
MIME-Version: 1.0
Message-ID-Hash: R23JEGPJX22KSILEXGBWHNOSDJXRXABY
X-Message-ID-Hash: R23JEGPJX22KSILEXGBWHNOSDJXRXABY
X-MailFrom: jani.nikula@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Arnd Bergmann <arnd@arndb.de>, Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, llvm@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>, Federico Vaga <federico.vaga@vaga.pv.it>, Alex Shi <alexs@kernel.org>, Hu Haowen <src.res@email.cn>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc-tw-discuss@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-btrfs@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] [v2] Kbuild: move to -std=gnu11
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/R23JEGPJX22KSILEXGBWHNOSDJXRXABY/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCAyOCBGZWIgMjAyMiwgQXJuZCBCZXJnbWFubiA8YXJuZEBrZXJuZWwub3JnPiB3cm90
ZToNCj4gRnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4NCj4NCj4gRHVyaW5nIGEg
cGF0Y2ggZGlzY3Vzc2lvbiwgTGludXMgYnJvdWdodCB1cCB0aGUgb3B0aW9uIG9mIGNoYW5naW5n
DQo+IHRoZSBDIHN0YW5kYXJkIHZlcnNpb24gZnJvbSBnbnU4OSB0byBnbnU5OSwgd2hpY2ggYWxs
b3dzIHVzaW5nIHZhcmlhYmxlDQo+IGRlY2xhcmF0aW9uIGluc2lkZSBvZiBhIGZvcigpIGxvb3Au
IFdoaWxlIHRoZSBDOTksIEMxMSBhbmQgbGF0ZXIgc3RhbmRhcmRzDQo+IGludHJvZHVjZSBtYW55
IG90aGVyIGZlYXR1cmVzLCBtb3N0IG9mIHRoZXNlIGFyZSBhbHJlYWR5IGF2YWlsYWJsZSBpbg0K
PiBnbnU4OSBhcyBHTlUgZXh0ZW5zaW9ucyBhcyB3ZWxsLg0KPg0KPiBBbiBlYXJsaWVyIGF0dGVt
cHQgdG8gZG8gdGhpcyB3aGVuIGdjYy01IHN0YXJ0ZWQgZGVmYXVsdGluZyB0bw0KPiAtc3RkPWdu
dTExIGZhaWxlZCBiZWNhdXNlIGF0IHRoZSB0aW1lIHRoYXQgY2F1c2VkIHdhcm5pbmdzIGFib3V0
DQo+IGRlc2lnbmF0ZWQgaW5pdGlhbGl6ZXJzIHdpdGggb2xkZXIgY29tcGlsZXJzLiBOb3cgdGhh
dCBnY2MtNS4xIGlzIHRoZQ0KPiBtaW5pbXVtIGNvbXBpbGVyIHZlcnNpb24gdXNlZCBmb3IgYnVp
bGRpbmcga2VybmVscywgdGhhdCBpcyBubyBsb25nZXIgYQ0KPiBjb25jZXJuLiBTaW1pbGFybHks
IHRoZSBiZWhhdmlvciBvZiAnaW5saW5lJyBmdW5jdGlvbnMgY2hhbmdlcyBiZXR3ZWVuDQo+IGdu
dTg5IGFuZCBnbnUxMSwgYnV0IHRoaXMgd2FzIHRha2VuIGNhcmUgb2YgYnkgZGVmaW5pbmcgJ2lu
bGluZScgdG8NCj4gaW5jbHVkZSBfX2F0dHJpYnV0ZV9fKChnbnVfaW5saW5lKSkgaW4gb3JkZXIg
dG8gYWxsb3cgYnVpbGRpbmcgd2l0aA0KPiBjbGFuZyBhIHdoaWxlIGFnby4NCj4NCj4gT25lIG1p
bm9yIGlzc3VlIHRoYXQgcmVtYWlucyBpcyBhbiBhZGRlZCBnY2Mgd2FybmluZyBmb3Igc2hpZnRz
IG9mDQo+IG5lZ2F0aXZlIGludGVnZXJzIHdoZW4gYnVpbGRpbmcgd2l0aCAtV2Vycm9yLCB3aGlj
aCBoYXBwZW5zIHdpdGggdGhlDQo+ICdtYWtlIFc9MScgb3B0aW9uLCBhcyB3ZWxsIGFzIGZvciB0
aHJlZSBkcml2ZXJzIGluIHRoZSBrZXJuZWwgdGhhdCBhbHdheXMNCj4gZW5hYmxlIC1XZXJyb3Is
IGJ1dCBpdCB3YXMgb25seSBvYnNlcnZlZCB3aXRoIHRoZSBpOTE1IGRyaXZlciBzbyBmYXIuDQo+
IFRvIGJlIG9uIHRoZSBzYWZlIHNpZGUsIGFkZCAtV25vLXNoaWZ0LW5lZ2F0aXZlLXZhbHVlIHRv
IGFueSAtV2V4dHJhDQo+IGluIGEgTWFrZWZpbGUuDQoNCkRvIHlvdSBtZWFuIGFsd2F5cyBlbmFi
bGUgLVdhbGwgYW5kL29yIC1XZXh0cmEgaW5zdGVhZCBvZiAtV2Vycm9yPw0KDQpXZSBkbyB1c2Ug
LVdlcnJvciBmb3Igb3VyIENJIGFuZCBkZXZlbG9wbWVudCB0b28sIGJ1dCBpdCdzIGhpZGRlbiBi
ZWhpbmQNCmEgY29uZmlnIG9wdGlvbiB0aGF0IGRlcGVuZHMgb24gQ09NUElMRV9URVNUPW4gdG8g
YXZvaWQgYW55IHByb2JsZW1zDQp3aXRoIGFsbG1vZGNvbmZpZy9hbGx5ZXNjb25maWcuDQoNCkZv
ciB0aGUgZnV0dXJlLCBtYWtlcyBtZSB3b25kZXIgaWYgd2UgY291bGRuJ3QgaGF2ZSBhIHdheSBm
b3IgZHJpdmVycyB0bw0KbG9jYWxseSBlbmFibGUgLVdhbGwvLVdleHRyYSBpbiBhIHdheSB0aGF0
IGluY29ycG9yYXRlcyB0aGUgZXhjZXB0aW9ucw0KZnJvbSBrYnVpbGQgaW5zdGVhZCBvZiBoYXZp
bmcgdG8gZHVwbGljYXRlIHRoZW0uDQoNCkFueXdheSwgZm9yIHRoZSBpOTE1IGNoYW5nZXMsDQoN
CkFja2VkLWJ5OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPg0KDQo+DQo+IE5h
dGhhbiBDaGFuY2VsbG9yIHJlcG9ydGVkIGFuIGFkZGl0aW9uYWwgLVdkZWNsYXJhdGlvbi1hZnRl
ci1zdGF0ZW1lbnQNCj4gd2FybmluZyB0aGF0IGFwcGVhcnMgaW4gYSBzeXN0ZW0gaGVhZGVyIG9u
IGFybSwgdGhpcyBzdGlsbCBuZWVkcyBhDQo+IHdvcmthcm91bmQuDQo+DQo+IFRoZSBkaWZmZXJl
bmNlcyBiZXR3ZWVuIGdudTk5LCBnbnUxMSwgZ251MXggYW5kIGdudTE3IGFyZSBmYWlybHkNCj4g
bWluaW1hbCBhbmQgbWFpbmx5IGltcGFjdCB3YXJuaW5ncyBhdCB0aGUgLVdwZWRhbnRpYyBsZXZl
bCB0aGF0IHRoZQ0KPiBrZXJuZWwgbmV2ZXIgZW5hYmxlcy4gQmV0d2VlbiB0aGVzZSwgZ251MTEg
aXMgdGhlIG5ld2VzdCB2ZXJzaW9uDQo+IHRoYXQgaXMgc3VwcG9ydGVkIGJ5IGFsbCBzdXBwb3J0
ZWQgY29tcGlsZXIgdmVyc2lvbnMsIHRob3VnaCBpdCBpcw0KPiBvbmx5IHRoZSBkZWZhdWx0IG9u
IGdjYy01LCB3aGlsZSBhbGwgb3RoZXIgc3VwcG9ydGVkIHZlcnNpb25zIG9mDQo+IGdjYyBvciBj
bGFuZyBkZWZhdWx0IHRvIGdudTF4L2dudTE3Lg0KPg0KPiBMaW5rOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9sa21sL0NBSGstPXdpeUNIN3hlSGNtaUZKLVlnWFV5MkphajdwbmtkS3Bjb3Z0OGZZ
YlZGVzNUQUBtYWlsLmdtYWlsLmNvbS8NCj4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL0NsYW5n
QnVpbHRMaW51eC9saW51eC9pc3N1ZXMvMTYwMw0KPiBTdWdnZXN0ZWQtYnk6IExpbnVzIFRvcnZh
bGRzIDx0b3J2YWxkc0BsaW51eC1mb3VuZGF0aW9uLm9yZz4NCj4gQ2M6IE1hc2FoaXJvIFlhbWFk
YSA8bWFzYWhpcm95QGtlcm5lbC5vcmc+DQo+IENjOiBsaW51eC1rYnVpbGRAdmdlci5rZXJuZWwu
b3JnDQo+IENjOiBsbHZtQGxpc3RzLmxpbnV4LmRldg0KPiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJl
cmdtYW5uIDxhcm5kQGFybmRiLmRlPg0KPiAtLS0NCj4gW3YyXQ0KPiAgLSBhZGRlZCAtc3RkPWdu
dTExIGJhY2ssIHJhdGhlciB0aGFuIGp1c3QgcmVseWluZyBvbiB0aGUgZGVmYXVsdA0KPiAgLSBt
aW5vciBjaGFuZ2VzIHRvIGNoYW5nZWxvZyB0ZXh0DQo+IC0tLQ0KPiAgRG9jdW1lbnRhdGlvbi9w
cm9jZXNzL3Byb2dyYW1taW5nLWxhbmd1YWdlLnJzdCAgICAgICAgICAgICAgfCA0ICsrLS0NCj4g
IC4uLi90cmFuc2xhdGlvbnMvaXRfSVQvcHJvY2Vzcy9wcm9ncmFtbWluZy1sYW5ndWFnZS5yc3Qg
ICAgIHwgNCArKy0tDQo+ICAuLi4vdHJhbnNsYXRpb25zL3poX0NOL3Byb2Nlc3MvcHJvZ3JhbW1p
bmctbGFuZ3VhZ2UucnN0ICAgICB8IDQgKystLQ0KPiAgLi4uL3RyYW5zbGF0aW9ucy96aF9UVy9w
cm9jZXNzL3Byb2dyYW1taW5nLWxhbmd1YWdlLnJzdCAgICAgfCA0ICsrLS0NCj4gIE1ha2VmaWxl
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgNiAr
KystLS0NCj4gIGFyY2gvYXJtNjQva2VybmVsL3Zkc28zMi9NYWtlZmlsZSAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgMiArLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvTWFrZWZpbGUgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxICsNCj4gIGRyaXZlcnMvc3RhZ2luZy9ncmV5
YnVzL3Rvb2xzL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgIHwgMyArKy0NCj4gIGZzL2J0
cmZzL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
MSArDQo+ICBzY3JpcHRzL01ha2VmaWxlLmV4dHJhd2FybiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8IDEgKw0KPiAgMTAgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwg
MTMgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3Byb2Nlc3Mv
cHJvZ3JhbW1pbmctbGFuZ3VhZ2UucnN0IGIvRG9jdW1lbnRhdGlvbi9wcm9jZXNzL3Byb2dyYW1t
aW5nLWxhbmd1YWdlLnJzdA0KPiBpbmRleCBlYzQ3NGE3MGEwMmYuLjg5NGYyYTZlYjlkYiAxMDA2
NDQNCj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9wcm9jZXNzL3Byb2dyYW1taW5nLWxhbmd1YWdlLnJz
dA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL3Byb2Nlc3MvcHJvZ3JhbW1pbmctbGFuZ3VhZ2UucnN0
DQo+IEBAIC01LDggKzUsOCBAQCBQcm9ncmFtbWluZyBMYW5ndWFnZQ0KPiAgDQo+ICBUaGUga2Vy
bmVsIGlzIHdyaXR0ZW4gaW4gdGhlIEMgcHJvZ3JhbW1pbmcgbGFuZ3VhZ2UgW2MtbGFuZ3VhZ2Vd
Xy4NCj4gIE1vcmUgcHJlY2lzZWx5LCB0aGUga2VybmVsIGlzIHR5cGljYWxseSBjb21waWxlZCB3
aXRoIGBgZ2NjYGAgW2djY11fDQo+IC11bmRlciBgYC1zdGQ9Z251ODlgYCBbZ2NjLWMtZGlhbGVj
dC1vcHRpb25zXV86IHRoZSBHTlUgZGlhbGVjdCBvZiBJU08gQzkwDQo+IC0oaW5jbHVkaW5nIHNv
bWUgQzk5IGZlYXR1cmVzKS4gYGBjbGFuZ2BgIFtjbGFuZ11fIGlzIGFsc28gc3VwcG9ydGVkLCBz
ZWUNCj4gK3VuZGVyIGBgLXN0ZD1nbnUxMWBgIFtnY2MtYy1kaWFsZWN0LW9wdGlvbnNdXzogdGhl
IEdOVSBkaWFsZWN0IG9mIElTTyBDMTENCj4gKyhpbmNsdWRpbmcgc29tZSBDMTcgZmVhdHVyZXMp
LiBgYGNsYW5nYGAgW2NsYW5nXV8gaXMgYWxzbyBzdXBwb3J0ZWQsIHNlZQ0KPiAgZG9jcyBvbiA6
cmVmOmBCdWlsZGluZyBMaW51eCB3aXRoIENsYW5nL0xMVk0gPGtidWlsZF9sbHZtPmAuDQo+ICAN
Cj4gIFRoaXMgZGlhbGVjdCBjb250YWlucyBtYW55IGV4dGVuc2lvbnMgdG8gdGhlIGxhbmd1YWdl
IFtnbnUtZXh0ZW5zaW9uc11fLA0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xh
dGlvbnMvaXRfSVQvcHJvY2Vzcy9wcm9ncmFtbWluZy1sYW5ndWFnZS5yc3QgYi9Eb2N1bWVudGF0
aW9uL3RyYW5zbGF0aW9ucy9pdF9JVC9wcm9jZXNzL3Byb2dyYW1taW5nLWxhbmd1YWdlLnJzdA0K
PiBpbmRleCA0MWRiMjU5OGNlMTEuLmFhMjEwOTc3MzdhZSAxMDA2NDQNCj4gLS0tIGEvRG9jdW1l
bnRhdGlvbi90cmFuc2xhdGlvbnMvaXRfSVQvcHJvY2Vzcy9wcm9ncmFtbWluZy1sYW5ndWFnZS5y
c3QNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvaXRfSVQvcHJvY2Vzcy9wcm9n
cmFtbWluZy1sYW5ndWFnZS5yc3QNCj4gQEAgLTEwLDggKzEwLDggQEAgTGluZ3VhZ2dpbyBkaSBw
cm9ncmFtbWF6aW9uZQ0KPiAgDQo+ICBJbCBrZXJuZWwgw6ggc2NyaXR0byBuZWwgbGluZ3VhZ2dp
byBkaSBwcm9ncmFtbWF6aW9uZSBDIFtpdC1jLWxhbmd1YWdlXV8uDQo+ICBQacO5IHByZWNpc2Ft
ZW50ZSwgaWwga2VybmVsIHZpZW5lIGNvbXBpbGF0byBjb24gYGBnY2NgYCBbaXQtZ2NjXV8gdXNh
bmRvDQo+IC1sJ29wemlvbmUgYGAtc3RkPWdudTg5YGAgW2l0LWdjYy1jLWRpYWxlY3Qtb3B0aW9u
c11fOiBpbCBkaWFsZXR0byBHTlUNCj4gLWRlbGxvIHN0YW5kYXJkIElTTyBDOTAgKGNvbiBsJ2Fn
Z2l1bnRhIGRpIGFsY3VuZSBmdW56aW9uYWxpdMOgIGRhIEM5OSkuDQo+ICtsJ29wemlvbmUgYGAt
c3RkPWdudTExYGAgW2l0LWdjYy1jLWRpYWxlY3Qtb3B0aW9uc11fOiBpbCBkaWFsZXR0byBHTlUN
Cj4gK2RlbGxvIHN0YW5kYXJkIElTTyBDMTEgKGNvbiBsJ2FnZ2l1bnRhIGRpIGFsY3VuZSBmdW56
aW9uYWxpdMOgIGRhIEMxNykuDQo+ICBMaW51eCBzdXBwb3J0YSBhbmNoZSBgYGNsYW5nYGAgW2l0
LWNsYW5nXV8sIGxlZ2dldGUgbGEgZG9jdW1lbnRhemlvbmUNCj4gIDpyZWY6YEJ1aWxkaW5nIExp
bnV4IHdpdGggQ2xhbmcvTExWTSA8a2J1aWxkX2xsdm0+YC4NCj4gIA0KPiBkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vcHJvY2Vzcy9wcm9ncmFtbWluZy1sYW5n
dWFnZS5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9wcm9jZXNzL3Byb2dy
YW1taW5nLWxhbmd1YWdlLnJzdA0KPiBpbmRleCAyYTQ3YTFkMmVjMjAuLjU4ZDJiM2JkMmQ4NSAx
MDA2NDQNCj4gLS0tIGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vcHJvY2Vzcy9w
cm9ncmFtbWluZy1sYW5ndWFnZS5yc3QNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlv
bnMvemhfQ04vcHJvY2Vzcy9wcm9ncmFtbWluZy1sYW5ndWFnZS5yc3QNCj4gQEAgLTksOCArOSw4
IEBADQo+ICA9PT09PT09PT09PT0NCj4gIA0KPiAg5YaF5qC45piv55SoQ+ivreiogCA6cmVmOmBj
LWxhbmd1YWdlIDxjbl9jLWxhbmd1YWdlPmAg57yW5YaZ55qE44CC5pu05YeG56Gu5Zyw6K+077yM
5YaF5qC46YCa5bi45piv55SoIDpyZWY6YGdjYyA8Y25fZ2NjPmANCj4gLeWcqCBgYC1zdGQ9Z251
ODlgYCA6cmVmOmBnY2MtYy1kaWFsZWN0LW9wdGlvbnMgPGNuX2djYy1jLWRpYWxlY3Qtb3B0aW9u
cz5gIOS4i+e8luivkeeahO+8mklTTyBDOTDnmoQgR05VIOaWueiogO+8iA0KPiAt5YyF5ous5LiA
5LqbQzk554m55oCn77yJDQo+ICvlnKggYGAtc3RkPWdudTExYGAgOnJlZjpgZ2NjLWMtZGlhbGVj
dC1vcHRpb25zIDxjbl9nY2MtYy1kaWFsZWN0LW9wdGlvbnM+YCDkuIvnvJbor5HnmoTvvJpJU08g
QzEx55qEIEdOVSDmlrnoqIDvvIgNCj4gK+WMheaLrOS4gOS6m0MxN+eJueaAp++8iQ0KPiAgDQo+
ICDov5nnp43mlrnoqIDljIXlkKvlr7nor63oqIAgOnJlZjpgZ251LWV4dGVuc2lvbnMgPGNuX2du
dS1leHRlbnNpb25zPmAg55qE6K645aSa5omp5bGV77yM5b2T54S277yM5a6D5Lus6K645aSa6YO9
5Zyo5YaF5qC45Lit5L2/55So44CCDQo+ICANCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
dHJhbnNsYXRpb25zL3poX1RXL3Byb2Nlc3MvcHJvZ3JhbW1pbmctbGFuZ3VhZ2UucnN0IGIvRG9j
dW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfVFcvcHJvY2Vzcy9wcm9ncmFtbWluZy1sYW5ndWFn
ZS5yc3QNCj4gaW5kZXggNTRlMzY5OWVhZGY4Li4yMzVkZTA1ZjdlMmMgMTAwNjQ0DQo+IC0tLSBh
L0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX1RXL3Byb2Nlc3MvcHJvZ3JhbW1pbmctbGFu
Z3VhZ2UucnN0DQo+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX1RXL3Byb2Nl
c3MvcHJvZ3JhbW1pbmctbGFuZ3VhZ2UucnN0DQo+IEBAIC0xMiw4ICsxMiw4IEBADQo+ICA9PT09
PT09PT09PT0NCj4gIA0KPiAg5YWn5qC45piv55SoQ+iqnuiogCA6cmVmOmBjLWxhbmd1YWdlIDx0
d19jLWxhbmd1YWdlPmAg57eo5a+r55qE44CC5pu05rqW56K65Zyw6Kqq77yM5YWn5qC46YCa5bi4
5piv55SoIDpyZWY6YGdjYyA8dHdfZ2NjPmANCj4gLeWcqCBgYC1zdGQ9Z251ODlgYCA6cmVmOmBn
Y2MtYy1kaWFsZWN0LW9wdGlvbnMgPHR3X2djYy1jLWRpYWxlY3Qtb3B0aW9ucz5gIOS4i+e3qOit
r+eahO+8mklTTyBDOTDnmoQgR05VIOaWueiogO+8iA0KPiAt5YyF5ous5LiA5LqbQzk554m55oCn
77yJDQo+ICvlnKggYGAtc3RkPWdudTExYGAgOnJlZjpgZ2NjLWMtZGlhbGVjdC1vcHRpb25zIDx0
d19nY2MtYy1kaWFsZWN0LW9wdGlvbnM+YCDkuIvnt6jora/nmoTvvJpJU08gQzEx55qEIEdOVSDm
lrnoqIDvvIgNCj4gK+WMheaLrOS4gOS6m0MxN+eJueaAp++8iQ0KPiAgDQo+ICDpgJnnqK7mlrno
qIDljIXlkKvlsI3oqp7oqIAgOnJlZjpgZ251LWV4dGVuc2lvbnMgPHR3X2dudS1leHRlbnNpb25z
PmAg55qE6Kix5aSa5pO05bGV77yM55W254S277yM5a6D5YCR6Kix5aSa6YO95Zyo5YWn5qC45Lit
5L2/55So44CCDQo+ICANCj4gZGlmZiAtLWdpdCBhL01ha2VmaWxlIGIvTWFrZWZpbGUNCj4gaW5k
ZXggMjg5Y2UyYmU4MDMyLi42NjQ5NmVhZWI5ZWMgMTAwNjQ0DQo+IC0tLSBhL01ha2VmaWxlDQo+
ICsrKyBiL01ha2VmaWxlDQo+IEBAIC00MzIsNyArNDMyLDcgQEAgSE9TVENYWAk9IGcrKw0KPiAg
ZW5kaWYNCj4gIA0KPiAgZXhwb3J0IEtCVUlMRF9VU0VSQ0ZMQUdTIDo9IC1XYWxsIC1XbWlzc2lu
Zy1wcm90b3R5cGVzIC1Xc3RyaWN0LXByb3RvdHlwZXMgXA0KPiAtCQkJICAgICAgLU8yIC1mb21p
dC1mcmFtZS1wb2ludGVyIC1zdGQ9Z251ODkNCj4gKwkJCSAgICAgIC1PMiAtZm9taXQtZnJhbWUt
cG9pbnRlciAtc3RkPWdudTExDQo+ICBleHBvcnQgS0JVSUxEX1VTRVJMREZMQUdTIDo9DQo+ICAN
Cj4gIEtCVUlMRF9IT1NUQ0ZMQUdTICAgOj0gJChLQlVJTERfVVNFUkNGTEFHUykgJChIT1NUX0xG
U19DRkxBR1MpICQoSE9TVENGTEFHUykNCj4gQEAgLTUxNSw3ICs1MTUsNyBAQCBLQlVJTERfQ0ZM
QUdTICAgOj0gLVdhbGwgLVd1bmRlZiAtV2Vycm9yPXN0cmljdC1wcm90b3R5cGVzIC1Xbm8tdHJp
Z3JhcGhzIFwNCj4gIAkJICAgLWZuby1zdHJpY3QtYWxpYXNpbmcgLWZuby1jb21tb24gLWZzaG9y
dC13Y2hhciAtZm5vLVBJRSBcDQo+ICAJCSAgIC1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVj
bGFyYXRpb24gLVdlcnJvcj1pbXBsaWNpdC1pbnQgXA0KPiAgCQkgICAtV2Vycm9yPXJldHVybi10
eXBlIC1Xbm8tZm9ybWF0LXNlY3VyaXR5IFwNCj4gLQkJICAgLXN0ZD1nbnU4OQ0KPiArCQkgICAt
c3RkPWdudTExDQo+ICBLQlVJTERfQ1BQRkxBR1MgOj0gLURfX0tFUk5FTF9fDQo+ICBLQlVJTERf
QUZMQUdTX0tFUk5FTCA6PQ0KPiAgS0JVSUxEX0NGTEFHU19LRVJORUwgOj0NCj4gQEAgLTc4Miw3
ICs3ODIsNyBAQCBLQlVJTERfQ0ZMQUdTICs9ICQoS0JVSUxEX0NGTEFHUy15KSAkKENPTkZJR19D
Q19JTVBMSUNJVF9GQUxMVEhST1VHSCkNCj4gIA0KPiAgaWZkZWYgQ09ORklHX0NDX0lTX0NMQU5H
DQo+ICBLQlVJTERfQ1BQRkxBR1MgKz0gLVF1bnVzZWQtYXJndW1lbnRzDQo+IC0jIFRoZSBrZXJu
ZWwgYnVpbGRzIHdpdGggJy1zdGQ9Z251ODknIHNvIHVzZSBvZiBHTlUgZXh0ZW5zaW9ucyBpcyBh
Y2NlcHRhYmxlLg0KPiArIyBUaGUga2VybmVsIGJ1aWxkcyB3aXRoICctc3RkPWdudTExJyBzbyB1
c2Ugb2YgR05VIGV4dGVuc2lvbnMgaXMgYWNjZXB0YWJsZS4NCj4gIEtCVUlMRF9DRkxBR1MgKz0g
LVduby1nbnUNCj4gICMgQ0xBTkcgdXNlcyBhIF9NZXJnZWRHbG9iYWxzIGFzIG9wdGltaXphdGlv
biwgYnV0IHRoaXMgYnJlYWtzIG1vZHBvc3QsIGFzIHRoZQ0KPiAgIyBzb3VyY2Ugb2YgYSByZWZl
cmVuY2Ugd2lsbCBiZSBfTWVyZ2VkR2xvYmFscyBhbmQgbm90IG9uIG9mIHRoZSB3aGl0ZWxpc3Rl
ZCBuYW1lcy4NCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQva2VybmVsL3Zkc28zMi9NYWtlZmls
ZSBiL2FyY2gvYXJtNjQva2VybmVsL3Zkc28zMi9NYWtlZmlsZQ0KPiBpbmRleCA2YzAxYjYzZmY1
NmQuLjkzNzhlYTA1NWJmMiAxMDA2NDQNCj4gLS0tIGEvYXJjaC9hcm02NC9rZXJuZWwvdmRzbzMy
L01ha2VmaWxlDQo+ICsrKyBiL2FyY2gvYXJtNjQva2VybmVsL3Zkc28zMi9NYWtlZmlsZQ0KPiBA
QCAtNjgsNyArNjgsNyBAQCBWRFNPX0NGTEFHUyArPSAtV2FsbCAtV3VuZGVmIC1Xc3RyaWN0LXBy
b3RvdHlwZXMgLVduby10cmlncmFwaHMgXA0KPiAgICAgICAgICAgICAgICAgLWZuby1zdHJpY3Qt
YWxpYXNpbmcgLWZuby1jb21tb24gXA0KPiAgICAgICAgICAgICAgICAgLVdlcnJvci1pbXBsaWNp
dC1mdW5jdGlvbi1kZWNsYXJhdGlvbiBcDQo+ICAgICAgICAgICAgICAgICAtV25vLWZvcm1hdC1z
ZWN1cml0eSBcDQo+IC0gICAgICAgICAgICAgICAtc3RkPWdudTg5DQo+ICsgICAgICAgICAgICAg
ICAtc3RkPWdudTExDQo+ICBWRFNPX0NGTEFHUyAgKz0gLU8yDQo+ICAjIFNvbWUgdXNlZnVsIGNv
bXBpbGVyLWRlcGVuZGVudCBmbGFncyBmcm9tIHRvcC1sZXZlbCBNYWtlZmlsZQ0KPiAgVkRTT19D
RkxBR1MgKz0gJChjYWxsIGNjMzItb3B0aW9uLC1XZGVjbGFyYXRpb24tYWZ0ZXItc3RhdGVtZW50
LCkNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L01ha2VmaWxlIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvTWFrZWZpbGUNCj4gaW5kZXggMWI2MmI5ZjY1MTk2Li4xNjE4YTZlMGFm
NGUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L01ha2VmaWxlDQo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L01ha2VmaWxlDQo+IEBAIC0xNyw2ICsxNyw3IEBAIHN1YmRp
ci1jY2ZsYWdzLXkgKz0gLVduby11bnVzZWQtcGFyYW1ldGVyDQo+ICBzdWJkaXItY2NmbGFncy15
ICs9IC1Xbm8tdHlwZS1saW1pdHMNCj4gIHN1YmRpci1jY2ZsYWdzLXkgKz0gLVduby1taXNzaW5n
LWZpZWxkLWluaXRpYWxpemVycw0KPiAgc3ViZGlyLWNjZmxhZ3MteSArPSAtV25vLXNpZ24tY29t
cGFyZQ0KPiArc3ViZGlyLWNjZmxhZ3MteSArPSAtV25vLXNoaWZ0LW5lZ2F0aXZlLXZhbHVlDQo+
ICBzdWJkaXItY2NmbGFncy15ICs9ICQoY2FsbCBjYy1kaXNhYmxlLXdhcm5pbmcsIHVudXNlZC1i
dXQtc2V0LXZhcmlhYmxlKQ0KPiAgc3ViZGlyLWNjZmxhZ3MteSArPSAkKGNhbGwgY2MtZGlzYWJs
ZS13YXJuaW5nLCBmcmFtZS1hZGRyZXNzKQ0KPiAgc3ViZGlyLWNjZmxhZ3MtJChDT05GSUdfRFJN
X0k5MTVfV0VSUk9SKSArPSAtV2Vycm9yDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcv
Z3JleWJ1cy90b29scy9NYWtlZmlsZSBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3Rvb2xzL01h
a2VmaWxlDQo+IGluZGV4IGFkMGFlODA1M2I3OS4uYTNiYmQ3MzE3MWYyIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy90b29scy9NYWtlZmlsZQ0KPiArKysgYi9kcml2ZXJz
L3N0YWdpbmcvZ3JleWJ1cy90b29scy9NYWtlZmlsZQ0KPiBAQCAtMTIsNyArMTIsOCBAQCBDRkxB
R1MJKz0gLXN0ZD1nbnU5OSAtV2FsbCAtV2V4dHJhIC1nIFwNCj4gIAkgICAgLVdyZWR1bmRhbnQt
ZGVjbHMgXA0KPiAgCSAgICAtV2Nhc3QtYWxpZ24gXA0KPiAgCSAgICAtV3NpZ24tY29tcGFyZSBc
DQo+IC0JICAgIC1Xbm8tbWlzc2luZy1maWVsZC1pbml0aWFsaXplcnMNCj4gKwkgICAgLVduby1t
aXNzaW5nLWZpZWxkLWluaXRpYWxpemVycyBcDQo+ICsJICAgIC1Xbm8tc2hpZnQtbmVnYXRpdmUt
dmFsdWUNCj4gIA0KPiAgQ0MJOj0gJChDUk9TU19DT01QSUxFKWdjYw0KPiAgDQo+IGRpZmYgLS1n
aXQgYS9mcy9idHJmcy9NYWtlZmlsZSBiL2ZzL2J0cmZzL01ha2VmaWxlDQo+IGluZGV4IDQxODhi
YTNmZDhjMy4uOTlmOTk5NTY3MGVhIDEwMDY0NA0KPiAtLS0gYS9mcy9idHJmcy9NYWtlZmlsZQ0K
PiArKysgYi9mcy9idHJmcy9NYWtlZmlsZQ0KPiBAQCAtMTcsNiArMTcsNyBAQCBzdWJkaXItY2Nm
bGFncy15ICs9ICQoY29uZGZsYWdzKQ0KPiAgc3ViZGlyLWNjZmxhZ3MteSArPSAtV25vLW1pc3Np
bmctZmllbGQtaW5pdGlhbGl6ZXJzDQo+ICBzdWJkaXItY2NmbGFncy15ICs9IC1Xbm8tc2lnbi1j
b21wYXJlDQo+ICBzdWJkaXItY2NmbGFncy15ICs9IC1Xbm8tdHlwZS1saW1pdHMNCj4gK3N1YmRp
ci1jY2ZsYWdzLXkgKz0gLVduby1zaGlmdC1uZWdhdGl2ZS12YWx1ZQ0KPiAgDQo+ICBvYmotJChD
T05GSUdfQlRSRlNfRlMpIDo9IGJ0cmZzLm8NCj4gIA0KPiBkaWZmIC0tZ2l0IGEvc2NyaXB0cy9N
YWtlZmlsZS5leHRyYXdhcm4gYi9zY3JpcHRzL01ha2VmaWxlLmV4dHJhd2Fybg0KPiBpbmRleCA4
YmU4OTI4ODdkNzEuLjY1MGQwYjhjZWVjMyAxMDA2NDQNCj4gLS0tIGEvc2NyaXB0cy9NYWtlZmls
ZS5leHRyYXdhcm4NCj4gKysrIGIvc2NyaXB0cy9NYWtlZmlsZS5leHRyYXdhcm4NCj4gQEAgLTM2
LDYgKzM2LDcgQEAgS0JVSUxEX0NGTEFHUyArPSAkKGNhbGwgY2Mtb3B0aW9uLCAtV3N0cmluZ29w
LXRydW5jYXRpb24pDQo+ICBLQlVJTERfQ0ZMQUdTICs9IC1Xbm8tbWlzc2luZy1maWVsZC1pbml0
aWFsaXplcnMNCj4gIEtCVUlMRF9DRkxBR1MgKz0gLVduby1zaWduLWNvbXBhcmUNCj4gIEtCVUlM
RF9DRkxBR1MgKz0gLVduby10eXBlLWxpbWl0cw0KPiArS0JVSUxEX0NGTEFHUyArPSAtV25vLXNo
aWZ0LW5lZ2F0aXZlLXZhbHVlDQo+ICANCj4gIEtCVUlMRF9DUFBGTEFHUyArPSAtREtCVUlMRF9F
WFRSQV9XQVJOMQ0KDQotLSANCkphbmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFwaGlj
cyBDZW50ZXINCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3Jn
ClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMu
bGluYXJvLm9yZwo=
