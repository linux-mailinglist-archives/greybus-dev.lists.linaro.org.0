Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4A486CCA9
	for <lists+greybus-dev@lfdr.de>; Thu, 29 Feb 2024 16:16:04 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 53F6844262
	for <lists+greybus-dev@lfdr.de>; Thu, 29 Feb 2024 15:16:03 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	by lists.linaro.org (Postfix) with ESMTPS id 836293F377
	for <greybus-dev@lists.linaro.org>; Thu, 29 Feb 2024 15:15:55 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=h0Tx6NJh;
	spf=pass (lists.linaro.org: domain of vaibhav.sr@gmail.com designates 209.85.128.44 as permitted sender) smtp.mailfrom=vaibhav.sr@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-412c227c80bso2682615e9.1
        for <greybus-dev@lists.linaro.org>; Thu, 29 Feb 2024 07:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709219754; x=1709824554; darn=lists.linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9wui/V5y8FOLo8YiI+83F7lgNFV8HwNcsEwhvDRA3dk=;
        b=h0Tx6NJh0k4NeHp39db6WmqwQwOfihMAgqlsJQWGtgsqtAlhycAhnZ64C/NMtPFn2O
         gwNyWRvtzKLtbP6FB1yEUFahDcEZKpReQ2Ga6H9rRAZNCicG+Oc4G9EOS3HdFYHvY2Mi
         UGXP6rbgAleOiRXKZWcjie+5PyRIyva6rJnaOpDFcb6M9pWf1rDU4oKew+ijIb/f5Z4s
         6XNi7noQjAcrtGaVPrp5hlYF6ep/vbvKhMh7XGZG/gnOJYmhXHoQSIA693/KWh5WIypA
         NJVCFhtVOEJAhqKwebGYULumF+E76w8oEyFcDc92v2C3UJV1vlQe+aKPsfhZ3QU53Xxq
         mfIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709219754; x=1709824554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9wui/V5y8FOLo8YiI+83F7lgNFV8HwNcsEwhvDRA3dk=;
        b=ABkZNFfAiqZwM6uGa+XB/oPc36m+Lj86JkKNrWz6VbcS6SnGBscuksiVX/JRIWVr4r
         qWqQVgcuUalkIeZW+ZwovhpIzZOqSy2RqFY0T1jvch6KBQb5v3yLvMiJ7i5LqdMPKadp
         jcJzPCDduckcEnWH9oTrVXXi8FgVQMQf9L5WcQRYX5QPBLy5uJcGgLpBxVbg+nskHCPm
         b//bAlUkLY6yOUAzBzvcl8Xj9RoNXJhJnbo45pEKT/tEhD8t0gEm4pYbGxm95dkLxELX
         wIMZ34Nsqbgab0brc8pA/ILO8DbbKdES/EHWKkuA2qjI4j+arK3f0Q3pHqDDy9R23+4x
         30gA==
X-Forwarded-Encrypted: i=1; AJvYcCW8dwx59Hhz9FfNm5dA9FDjwTmErcTVeIVhpa9auJFcRkSK7jKWUIik4zxoGkdgqPhobD1IXAkKqcAMMc+xxmNWevCj8+JB+lwZDFCN
X-Gm-Message-State: AOJu0Yy25TbqYjlQ1julrUMoiyOXydqlmIZiuRzH8jEC8WYv6xTg+1F4
	996agpYzxVe0FQjuh2seVQFYmFweFMFr5OgIV7wI+SO/nQAru16kZ1jNtjykwh/W44P3+doN1cw
	bmR1kj3KORmbO6O9wxRi1yosLTHg=
X-Google-Smtp-Source: AGHT+IHBfx8h6PdIH43PxYY+wWK3aRQjRg+CgGijUqZHtNSgcpoCMEjUhxFG+Ur8m68bSm1/0QI0M0MWqrtcFGzwaAY=
X-Received: by 2002:adf:ed89:0:b0:33d:afbc:6c76 with SMTP id
 c9-20020adfed89000000b0033dafbc6c76mr1609517wro.1.1709219754260; Thu, 29 Feb
 2024 07:15:54 -0800 (PST)
MIME-Version: 1.0
References: <20240229120541.219429-1-colin.i.king@gmail.com> <f7b36055-a710-4d57-b952-33431876e221@ieee.org>
In-Reply-To: <f7b36055-a710-4d57-b952-33431876e221@ieee.org>
From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
Date: Thu, 29 Feb 2024 20:45:17 +0530
Message-ID: <CAAs3649g_nr5-6PLnGL31ouo5GMhn7o0zuDOjSO+HmG6vUnkXQ@mail.gmail.com>
To: Alex Elder <elder@ieee.org>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 836293F377
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.50 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_CC(0.00)[gmail.com,animalcreek.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.44:from];
	FREEMAIL_ENVFROM(0.00)[gmail.com]
Message-ID-Hash: M2KJHUIA3CJE7GIMUXH75QQZYBORZJL6
X-Message-ID-Hash: M2KJHUIA3CJE7GIMUXH75QQZYBORZJL6
X-MailFrom: vaibhav.sr@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Colin Ian King <colin.i.king@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH][next] staging: greybus: Remove redundant variable 'mask'
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/M2KJHUIA3CJE7GIMUXH75QQZYBORZJL6/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCBGZWIgMjksIDIwMjQgYXQgNjo1MeKAr1BNIEFsZXggRWxkZXIgPGVsZGVyQGllZWUu
b3JnPiB3cm90ZToNCj4NCj4gT24gMi8yOS8yNCA2OjA1IEFNLCBDb2xpbiBJYW4gS2luZyB3cm90
ZToNCj4gPiBUaGUgdmFyaWFibGUgbWFzayBpcyBiZWluZyBhc3NpZ25lZCBhbmQgYml0LXNldCBi
dXQgaXQgaXMgbmV2ZXINCj4gPiBiZWluZyB1c2VkIGFwYXJ0IGZyb20gdGhpcy4gVGhlIHZhcmlh
YmxlIGlzIHJlZHVuZGFudCBhbmQgY2FuDQo+ID4gYmUgcmVtb3ZlZC4NCj4gPg0KPiA+IENsZWFu
cyB1cCBjbGFuZyBzY2FuIGJ1aWxkIHdhcm5pbmc6DQo+ID4gZHJpdmVycy9zdGFnaW5nL2dyZXli
dXMvYXVkaW9fdG9wb2xvZ3kuYzo3NjQ6MTU6IHdhcm5pbmc6IHZhcmlhYmxlICdtYXNrJw0KPiA+
IHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdDQo+ID4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4uaS5raW5nQGdtYWlsLmNvbT4NCg0K
VGhhbmtzIENvbGluIGZvciBzaGFyaW5nIHRoaXMgcGF0Y2guDQoNCj4NCj4NCj4gVGhpcyBpcyBh
IHJlYXNvbmFibGUgY2hhbmdlLCBidXQgSSBkb24ndCBrbm93IHRoaXMgY29kZSB0aGF0DQo+IHdl
bGwgYW5kIHdvdWxkIGxpa2UgdG8gaGVhciBmcm9tIFZhaWJoYXYgKGlmIHBvc3NpYmxlKSBvcg0K
PiBzb21lb25lIGVsc2Ugd2hldGhlciB0aGV5IHRoaW5rIHRoZSBtYXNrIHZhbHVlICpzaG91bGQq
IGhhdmUNCj4gYmVlbiB1c2VkIGluIHRoaXMgc3BvdC4gIEl0IGRvZXNuJ3QgbG9vayBsaWtlIGl0
IHRvIG1lLCBidXQNCj4gSSdkIGxpa2UgeW91IHRvIGdldCBhIHNlY29uZCBvcGluaW9uLi4uDQoN
ClRoZSBvcmlnaW5hbCBpbnRlbnQgd2FzIHVzZSB0aGUgbWFzayBmaWVsZCB3aGlsZSBtYWludGFp
bmluZyByZWdtYXAgZW50cmllcy4NCkhvd2V2ZXIsIEkgY291bGQgbm90IHB1c2ggY2hhbmdlcyBv
biAibWFpbnRhaW4gcmVnbWFwIiBkdXJpbmcgQVJBIGRheXMgOigNCkFueXdheXMsIGZvciBub3cg
aXQgbWFrZXMgc2Vuc2UgdG8gZHJvcCB0aGUgdW51c2VkIG1hc2sgdmFyaWFibGUuDQoNCj4NCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC1BbGV4DQo+DQo+ID4gLS0t
DQo+ID4gICBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb190b3BvbG9neS5jIHwgMyAtLS0N
Cj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX3RvcG9sb2d5LmMgYi9kcml2ZXJzL3N0
YWdpbmcvZ3JleWJ1cy9hdWRpb190b3BvbG9neS5jDQo+ID4gaW5kZXggMDhlNmE4MDdjMTMyLi41
ZGM0NzIxMTA1ZDQgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVk
aW9fdG9wb2xvZ3kuYw0KPiA+ICsrKyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX3Rv
cG9sb2d5LmMNCj4gPiBAQCAtNzYxLDcgKzc2MSw2IEBAIHN0YXRpYyBpbnQgZ2Jjb2RlY19lbnVt
X2RhcG1fY3RsX3B1dChzdHJ1Y3Qgc25kX2tjb250cm9sICprY29udHJvbCwNCj4gPiAgIHsNCj4g
PiAgICAgICBpbnQgcmV0LCB3aSwgY3RsX2lkOw0KPiA+ICAgICAgIHVuc2lnbmVkIGludCB2YWws
IG11eCwgY2hhbmdlOw0KPiA+IC0gICAgIHVuc2lnbmVkIGludCBtYXNrOw0KPiA+ICAgICAgIHN0
cnVjdCBzbmRfc29jX2RhcG1fd2lkZ2V0X2xpc3QgKndsaXN0ID0gc25kX2tjb250cm9sX2NoaXAo
a2NvbnRyb2wpOw0KPiA+ICAgICAgIHN0cnVjdCBzbmRfc29jX2RhcG1fd2lkZ2V0ICp3aWRnZXQg
PSB3bGlzdC0+d2lkZ2V0c1swXTsNCj4gPiAgICAgICBzdHJ1Y3QgZ2JfYXVkaW9fY3RsX2VsZW1f
dmFsdWUgZ2J2YWx1ZTsNCj4gPiBAQCAtODAyLDcgKzgwMSw2IEBAIHN0YXRpYyBpbnQgZ2Jjb2Rl
Y19lbnVtX2RhcG1fY3RsX3B1dChzdHJ1Y3Qgc25kX2tjb250cm9sICprY29udHJvbCwNCj4gPg0K
PiA+ICAgICAgIG11eCA9IHVjb250cm9sLT52YWx1ZS5lbnVtZXJhdGVkLml0ZW1bMF07DQo+ID4g
ICAgICAgdmFsID0gbXV4IDw8IGUtPnNoaWZ0X2w7DQo+ID4gLSAgICAgbWFzayA9IGUtPm1hc2sg
PDwgZS0+c2hpZnRfbDsNCj4gPg0KPiA+ICAgICAgIGlmIChsZTMyX3RvX2NwdShnYnZhbHVlLnZh
bHVlLmVudW1lcmF0ZWRfaXRlbVswXSkgIT0NCj4gPiAgICAgICAgICAgdWNvbnRyb2wtPnZhbHVl
LmVudW1lcmF0ZWQuaXRlbVswXSkgew0KPiA+IEBAIC04MTUsNyArODEzLDYgQEAgc3RhdGljIGlu
dCBnYmNvZGVjX2VudW1fZGFwbV9jdGxfcHV0KHN0cnVjdCBzbmRfa2NvbnRyb2wgKmtjb250cm9s
LA0KPiA+ICAgICAgICAgICAgICAgaWYgKHVjb250cm9sLT52YWx1ZS5lbnVtZXJhdGVkLml0ZW1b
MV0gPiBlLT5pdGVtcyAtIDEpDQo+ID4gICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlO
VkFMOw0KPiA+ICAgICAgICAgICAgICAgdmFsIHw9IHVjb250cm9sLT52YWx1ZS5lbnVtZXJhdGVk
Lml0ZW1bMV0gPDwgZS0+c2hpZnRfcjsNCj4gPiAtICAgICAgICAgICAgIG1hc2sgfD0gZS0+bWFz
ayA8PCBlLT5zaGlmdF9yOw0KPiA+ICAgICAgICAgICAgICAgaWYgKGxlMzJfdG9fY3B1KGdidmFs
dWUudmFsdWUuZW51bWVyYXRlZF9pdGVtWzFdKSAhPQ0KPiA+ICAgICAgICAgICAgICAgICAgIHVj
b250cm9sLT52YWx1ZS5lbnVtZXJhdGVkLml0ZW1bMV0pIHsNCj4gPiAgICAgICAgICAgICAgICAg
ICAgICAgY2hhbmdlID0gMTsNCj4NCg0KQWNrZWQtYnk6IFZhaWJoYXYgQWdhcndhbCA8dmFpYmhh
di5zckBnbWFpbC5jb20+DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGlu
YXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZl
QGxpc3RzLmxpbmFyby5vcmcK
