Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C88E6DE120
	for <lists+greybus-dev@lfdr.de>; Tue, 11 Apr 2023 18:40:51 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0F4353EBCB
	for <lists+greybus-dev@lfdr.de>; Tue, 11 Apr 2023 16:40:50 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	by lists.linaro.org (Postfix) with ESMTPS id 3E4703ECC8
	for <greybus-dev@lists.linaro.org>; Mon, 10 Apr 2023 23:40:20 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=oCzfxBcr;
	spf=pass (lists.linaro.org: domain of fancer.lancer@gmail.com designates 209.85.167.46 as permitted sender) smtp.mailfrom=fancer.lancer@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id i26so8635414lfc.6
        for <greybus-dev@lists.linaro.org>; Mon, 10 Apr 2023 16:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681170019; x=1683762019;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fur996rCaWYVGAHkL9B8t6UIa+8lHC0yv4M9nEOrYXo=;
        b=oCzfxBcreBt29EaLl+71B9b/Q9qgIZXp6nVXJ/ZVkuB6CVfBsRJFo1lAUD3/GAxFV6
         SVaBq0XwHUQ/TrhgfQF9QOmyhqqd3zQfSd8jl80BrU+bY5s0EnJc9ix5dwLvlaD/tVPf
         LlFnUsb2/Nmzgv+1PPlABYMwmnZDgH40woWrYLJFXHGmsy9+O5IPZwiwrLfcLIAT3BXS
         f/VArm7ldvG9/3oB5MrWFo70/hcUl9fJjkMmbD+Ph0W+rED701KZ70PrujsFfwa1BBEb
         G4pLZhhbAkHpTuhYZCurpub93G9rBQH7Pu7FqbOMgmPVJW9n6yyTfMzEqn6e8EowxiW6
         yiEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681170019; x=1683762019;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fur996rCaWYVGAHkL9B8t6UIa+8lHC0yv4M9nEOrYXo=;
        b=ILq4dYsJXrTveQ2vNyesxDF9fxfMJiXHMadEXCu6o3Tc6tTn3KU18ABHRGmAqoJr+t
         u9JulXlWDC02s3ParT3caw2RVh/3TFGM5KPKiMNlCAMlRhKb5d7vlQr+13MGV8xW2ggq
         eBsW5ZrK3NuNMctAD9SkPzOw1KD2YBgojJpS9gSpBN7lGJZALfdP6K6jNExEWtxqC4hU
         b/s2l0/WDvCUAxEUD0+dxqy6h8aEab3+fTIqAiGea7OGoGAlJTby+YN+Hz92FGG29uij
         pCrPrlt+Tjw4+6vFe9Uvsziis+fP4pEQnMU2LNAF27tRVE3m0Fqk+UjW4fkI6K/yb1eP
         Y6qA==
X-Gm-Message-State: AAQBX9cddqKVmn/4hwIvN+fqrtFeUa6lZYzU4KDSAAP4S6UigzRF4V0J
	5Fu59JhOJMQ6BqMdQyl0iyo=
X-Google-Smtp-Source: AKy350Y8vHryK+xbHopzRc1cNjMjYH5S/Wo750TJjWInhOO3WY08PTqXauE7zSAidBeOMTmC84bjeA==
X-Received: by 2002:ac2:5292:0:b0:4eb:29b0:1ca4 with SMTP id q18-20020ac25292000000b004eb29b01ca4mr3506937lfm.8.1681170018902;
        Mon, 10 Apr 2023 16:40:18 -0700 (PDT)
Received: from mobilestation ([95.79.140.35])
        by smtp.gmail.com with ESMTPSA id v18-20020ac25612000000b004e9b4a8f738sm2284738lfd.152.2023.04.10.16.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 16:40:18 -0700 (PDT)
Date: Tue, 11 Apr 2023 02:40:16 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	sunying@nj.iscas.ac.cn
Message-ID: <20230410232725.zwbccyryboxj3bh5@mobilestation>
References: <bc6c86d.11bb9.1872c5aa2cb.Coremail.sunying@nj.iscas.ac.cn>
 <18c3fbb4-59db-d508-ddd6-080cc8944b39@opensource.wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <18c3fbb4-59db-d508-ddd6-080cc8944b39@opensource.wdc.com>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 3E4703ECC8
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.49 / 15.00];
	BAYES_HAM(-2.99)[99.94%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	MIME_GOOD(-0.10)[text/plain];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.167.46:from];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2]
X-MailFrom: fancer.lancer@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: IDOXQFT7W54SXJKCDUD2RRT6HG2HRT6B
X-Message-ID-Hash: IDOXQFT7W54SXJKCDUD2RRT6HG2HRT6B
X-Mailman-Approved-At: Tue, 11 Apr 2023 16:40:46 +0000
CC: Damien Le Moal <damien.lemoal@opensource.wdc.com>, linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-mips@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: Multiple undefined configuration options are dependent in Kconfig under the v6.3-rc4 drivers directory
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/IDOXQFT7W54SXJKCDUD2RRT6HG2HRT6B/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCBNYXIgMzAsIDIwMjMgYXQgMDc6MzQ6NThBTSArMDkwMCwgRGFtaWVuIExlIE1vYWwg
d3JvdGU6DQo+IE9uIDMvMjkvMjMgMTY6NTIsIOWtmea7oiB3cm90ZToNCj4gPiBJdCBoYXMgYmVl
biBkaXNjb3ZlcmVkIHRoYXQgdGhlIGZvbGxvd2luZyBjb25maWd1cmF0aW9uIG9wdGlvbnMgYXJl
IHVuZGVmaW5lZCBpbiB0aGUgY3VycmVudCBsYXRlc3QgdmVyc2lvbiwgdjYuMy1yYzQsIHlldCB0
aGV5IGFyZSBiZWluZyByZWxpZWQgdXBvbiBieSBvdGhlciBjb25maWd1cmF0aW9uIG9wdGlvbnMg
aW4gbXVsdGlwbGUgS2NvbmZpZyBmaWxlczoNCj4gPiANCj4gPiBNSVBTX0JBSUtBTF9UMSBpcyB1
bmRlZmluZWQsIHVzZWQgYXMgYSAnZGVwZW5kcyBvbicgY29uZGl0aW9uIGluIG11bHRpcGxlIGZp
bGVzIHN1Y2ggYXMgZHJpdmVycy9hdGEvS2NvbmZpZywgZHJpdmVycy9od21vbi9LY29uZmlnLCBk
cml2ZXJzL2J1cy9LY29uZmlnLCBhbmQgZHJpdmVycy9tZW1vcnkvS2NvbmZpZy4NCj4gPiBNRkRf
TUFYNTk3WCBpcyB1bmRlZmluZWQsIHVzZWQgYXMgYSAnZGVwZW5kcyBvbicgY29uZGl0aW9uIGlu
IEtjb25maWcgZmlsZSBkcml2ZXJzL3JlZ3VsYXRvci9LY29uZmlnLg0KPiA+IE1GRF9TTTU3MDMg
aXMgdW5kZWZpbmVkLCB1c2VkIGFzIGEgJ2RlcGVuZHMgb24nIGNvbmRpdGlvbiBpbiBLY29uZmln
IGZpbGUgZHJpdmVycy9yZWd1bGF0b3IvS2NvbmZpZy4NCj4gPiBBUkNIX1RIVU5ERVJCQVkgaXMg
dW5kZWZpbmVkLCB1c2VkIGFzIGEgJ2RlcGVuZHMgb24nIGNvbmRpdGlvbiBpbiBLY29uZmlnIGZp
bGVzIGRyaXZlcnMvcGluY3RybC9LY29uZmlnIGFuZCBkcml2ZXJzL3BoeS9pbnRlbC9LY29uZmln
Lg0KPiA+IEFSQ0hfQkNNNDkwOCBpcyB1bmRlZmluZWQsIHVzZWQgYXMgYSAnZGVwZW5kcyBvbicg
Y29uZGl0aW9uIGluIEtjb25maWcgZmlsZSBkcml2ZXJzL2xlZHMvYmxpbmsvS2NvbmZpZy4NCj4g
PiBNRkRfVE40OE1fQ1BMRCBpcyB1bmRlZmluZWQsIHVzZWQgYXMgYSAnZGVwZW5kcyBvbicgY29u
ZGl0aW9uIGluIEtjb25maWcgZmlsZXMgZHJpdmVycy9ncGlvL0tjb25maWcgYW5kIGRyaXZlcnMv
cmVzZXQvS2NvbmZpZy4gDQo+ID4gVVNCX0hTSUNfVVNCMzYxMyBpcyB1bmRlZmluZWQsIHVzZWQg
YXMgYSAnZGVwZW5kcyBvbicgY29uZGl0aW9uIGluIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL0tj
b25maWcgYW5kIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2FyY2hlLXBsYXRmb3JtLmMuDQoNClBs
ZWFzZSwgZG9uJ3QgZHJvcCB0aGUgTUlQU19CQUlLQUxfVDEgY29uZmlnLiBJdCB3aWxsIGJlIGRl
ZmluZWQgYW5kDQp0aHVzIHV0aWxpemVkIGFmdGVyIEkgc3VibWl0IHRoZSBTb0MgQ1NQIHN1cHBv
cnQgdG8gdGhlIE1JUFMgYXJjaC4NCg0KLVNlcmdlKHkpDQoNCj4gPiANCj4gPiBJZiB0aGVzZSA3
IGNvbmZpZ3VyYXRpb24gb3B0aW9ucyBhcmUgZGVwcmVjYXRlZCwgaXQgaXMgcmVjb21tZW5kZWQg
dG8gcmVtb3ZlIHRoZSBkZXBlbmRlbmNpZXMgb24gdGhlbSBpbiB0aGUgS2NvbmZpZyBmaWxlcy4g
DQo+ID4gSWYgdGhleSBhcmUgc3RpbGwgdXNlZnVsLCBpdCBpcyByZWNvbW1lbmRlZCB0byBkZWZp
bmUgdGhlbS4NCj4gDQo+ICsgbGludXgtYXJtICYgbGludXgtbWlwcw0KPiANCj4gV2hhdCBhYm91
dCB5b3Ugc2VuZCBwYXRjaGVzIHRvIGZpeCB0aGlzID8NCj4gDQo+ID4gDQo+ID4gDQo+ID4gQmVz
dCByZWdhcmRzLA0KPiA+IFlpbmcgU3VuDQo+ID4gUGVuZ3BlbmcgSG91DQo+ID4gWWFuamllIFJl
bg0KPiANCj4gLS0gDQo+IERhbWllbiBMZSBNb2FsDQo+IFdlc3Rlcm4gRGlnaXRhbCBSZXNlYXJj
aA0KPiANCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdy
ZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClRv
IHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGlu
YXJvLm9yZwo=
