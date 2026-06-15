Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aHeDCYPfL2o1IQUAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 15 Jun 2026 13:18:27 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DD1685ABB
	for <lists+greybus-dev@lfdr.de>; Mon, 15 Jun 2026 13:18:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=SdcCTzCU;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:google.com:reject}")
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9B3A340AA5
	for <lists+greybus-dev@lfdr.de>; Mon, 15 Jun 2026 11:18:25 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	by lists.linaro.org (Postfix) with ESMTPS id CF36C402FF
	for <greybus-dev@lists.linaro.org>; Mon, 15 Jun 2026 07:40:58 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-43bfe209e45so1893836fac.0
        for <greybus-dev@lists.linaro.org>; Mon, 15 Jun 2026 00:40:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781509258; cv=none;
        d=google.com; s=arc-20240605;
        b=HSLMeDI64aEZxEWAvomHS0XCCAOQxGBgz34utGUc73x9BeuMGq3mf2sJUQB6bdgvdW
         BaLEcM3LdgsFeVhPfGxNyQkPktSmPV6+B/62IqLpdhXGe96R8KpCzmfWzzDODAxldOHZ
         ngAdt9PBI2c/QIdCEAx1P3Kv6ker+gfAqxm/3rxryuPlpuiYFUW0b6Hs6jLni+fMKXXI
         BS6/BLNZOMesX1iFQC9Ay8lBYTBKL/dv0gkN9UTCAdfi36YfWBaqrPCr8KK8MvWyBl5R
         bwV6W2E9XrnALbyyWncBBVKYmQ84cU5/Ms47Dj6x6OkzgSNNzT1Q59ls8031FMhrQXtl
         bgDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IE8HobeaUqCnA7mGs2Q3M8sbMuPFsFo0Jzi7k33xENA=;
        fh=dvELskjL1klUX9vf58+hAEtoySOkcK7Tvc3MqAzQSC4=;
        b=OI2YhKwTEU+BhQ59GlW16QX9URE0A2XWgLy2Ci90eWbHs2f25SRJD5lKDkAIjqhVM1
         w7SOR0ZVjEEO+sHdTVEI925snbbHd5VxGhJNvReUsWKqiA5/b5KEjze7gRmMt2YxUr4b
         9R9/5OgIPzKZsDDVUIejulMVx9KG47YvgFzZ8fcpgWDDrRfTtvMLYXiOqhTreGocF/Nr
         nsw3/wHBMZrLAnePw6jKQSgG1jom7ubW656vn6POlY+lbimbtkVKVzajVNb1FMtEHKwt
         HAUFeiEUpbo2DnqaziIycTNrpSsewBljDy54243f84jmm08vwUP9A/9/lFsf1bnY83mS
         FXPA==;
        darn=lists.linaro.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781509258; x=1782114058; darn=lists.linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IE8HobeaUqCnA7mGs2Q3M8sbMuPFsFo0Jzi7k33xENA=;
        b=SdcCTzCUJ3z68dtcWghMjq9KPTel5gXcw9VNgCco/n/bKA3KPvdpvtcR2geyNGPXsD
         MUnyozyYKbdapkuxAYFZSTRbHZEDsC4ot8KqH3Qo3iEz/dXOd445nEGvdvV35D+aZoAq
         CxDFfFtymViWBpnqCmJjvtZE7va5a2LLLEHmLpUoksSl26USwjCafA/zygy5YcAFZGXf
         Qh4Znm/c1fEA45OLfN712MkXZYL59leMdZCU2I6Z9/7ORaU7nqayF5BSTAaBuiGYaEYF
         usYONbGge/w1/8d8vrsSYuw1zv1jqiQTiXtA5O8yxBe0VOSMgxjKQRVLW9TRHht9CODR
         V2SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781509258; x=1782114058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IE8HobeaUqCnA7mGs2Q3M8sbMuPFsFo0Jzi7k33xENA=;
        b=j6NdDe7YjtnqKrAkEZmrHhYL+sD7BNQ95FN58t1NW8krZhOPPhd1wW2r+v+qVSggkq
         GHwm2DAesbU0h7H43Z/bsPgAx4WwPWuDzhhjvnU3zwoirDWohQNzyw5N5fbFOF6zzGYR
         RGeC6EL4A2kk4LL3j3Q8OW30VulHodRGx5TJm5Euyhq6e11QmkoKODT5uMgHXlWRcE8+
         BnyDApqgxTHB9orB+zWN/M1/xmx56GQvP+qIscE1+uPxVZx6IQIZISfOD6bUlx4z3lOD
         sUdq6OkroTSUJK7KqGpld2WsK1ZmiPLJYYywkOXx3IOd/YhZ6VegC+cVWRQB7Bs45vaV
         upuA==
X-Forwarded-Encrypted: i=1; AFNElJ8cI1CJjV8mscZqwDyQ54CdtiZV23FHRE5x928/rH+WursLCPpDHhS8QfpATCr/PFiqTyej+U9h8+IHwA==@lists.linaro.org
X-Gm-Message-State: AOJu0YzQ7GC/JX8JRI0tze3IwstFaVwGw9g0I2icjn0mjNV52FAY7ene
	tfLcvi1suzvUCYd6Ay3u0gcu8LVg6QQlunCYJPVbzCjvgHE596txw8w3YMm/pOpdE5uoJXug2qP
	pV8wUDKhAbKiz+Ehk2u7zqp+UHXtAuF4=
X-Gm-Gg: Acq92OHYofdbVG8EOhgZT2Kp0Gj5RQPPu91awBVQpWlobIYMnPViuntvDbweC2eNzXd
	0UEucyemvEk5tnAUSmyFcSvTsACwY0Dkm1HnrJI5S18XIJHjG4H+qAp2X3Af/hCCnHb4bgplbEV
	YwTqf6jiiY5xFpV5s2fsLshNicDYQJyf3n1CCpMvJs297X8HwD0k1uqHcKl3PnTPGwp3jiYkhjA
	I1bbegcOx0GctcGeKubf2VK6dE8Fy/+GVzfM4Crdknmq+UXmGaCxLEDmW81z4htM141dLJXWhA6
	/zHvWGpgeg==
X-Received: by 2002:a05:6808:4f4f:b0:485:6015:adcb with SMTP id
 5614622812f47-4872f607be7mr9109815b6e.41.1781509258059; Mon, 15 Jun 2026
 00:40:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260614060857.15366-1-abdelnasserhussein11@gmail.com> <ai-n7jNPT862Wscj@stanley.mountain>
In-Reply-To: <ai-n7jNPT862Wscj@stanley.mountain>
From: nasser <abdelnasserhussein11@gmail.com>
Date: Mon, 15 Jun 2026 10:40:46 +0300
X-Gm-Features: AVVi8Cd0ZhmYYuHMTy6NJD7swxol4CahrZskhHcUGlPTi6_xrUEbZWC2MSOEM54
Message-ID: <CANpqX3ZdbboYZNe5N1e4VmG_En2ZJ=1S5XHPJR9tcpuiF3HN1g@mail.gmail.com>
To: Dan Carpenter <error27@gmail.com>
X-Spamd-Bar: -----
X-MailFrom: abdelnasserhussein11@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: Q6FXWMQ4VX4KQO5XGKCFYRTOZZJ4ZCFP
X-Message-ID-Hash: Q6FXWMQ4VX4KQO5XGKCFYRTOZZJ4ZCFP
X-Mailman-Approved-At: Mon, 15 Jun 2026 11:17:49 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus: audio: check sscanf() result directly
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/Q6FXWMQ4VX4KQO5XGKCFYRTOZZJ4ZCFP/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.69 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:error27@gmail.com,m:johan@kernel.org,m:elder@kernel.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:lkp@intel.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[abdelnasserhussein11@gmail.com,greybus-dev-bounces@lists.linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abdelnasserhussein11@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	TAGGED_RCPT(0.00)[greybus-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns,lists.linaro.org:from_smtp,mail.gmail.com:mid,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A9DD1685ABB

SGkgRGFuLA0KDQpUaGFua3MgYSBsb3QgZm9yIHRoZSBleHBsYW5hdGlvbiBhbmQgdGhlIHZhbHVh
YmxlIGluZm9ybWF0aW9uLiBJIHdpbGwNCmRlZmluaXRlbHkgdGFrZSB5b3VyIGFkdmljZSwgbGVh
cm4gZnJvbSB0aGlzLCBhbmQgZm9jdXMgb24gdGFja2xpbmcNCm1vcmUgaW1wb3J0YW50IGlzc3Vl
cyBnb2luZyBmb3J3YXJkLg0KDQpCZXN0IHJlZ2FyZHMsDQpBYmRlbG5hc3Nlcg0KDQoNCk9uIE1v
biwgSnVuIDE1LCAyMDI2IGF0IDEwOjIx4oCvQU0gRGFuIENhcnBlbnRlciA8ZXJyb3IyN0BnbWFp
bC5jb20+IHdyb3RlOg0KPg0KPiBPbiBTdW4sIEp1biAxNCwgMjAyNiBhdCAwOTowODo1N0FNICsw
MzAwLCBhYmRlbG5hc3NlciBodXNzZWluIHdyb3RlOg0KPiA+IFNtYXRjaCB3YXJuczoNCj4gPg0K
PiA+ICAgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fY29kZWMuYzozMzUgZ2JhdWRpb19t
b2R1bGVfdXBkYXRlKCkNCj4gPiAgIHdhcm46IHNzY2FuZiBkb2Vzbid0IHJldHVybiBlcnJvciBj
b2Rlcw0KPiA+DQo+ID4gc3NjYW5mKCkgcmV0dXJucyB0aGUgbnVtYmVyIG9mIHN1Y2Nlc3NmdWxs
eSBtYXRjaGVkIGlucHV0IGl0ZW1zLCBub3QgYQ0KPiA+IG5lZ2F0aXZlIGVycm9yIGNvZGUuIENv
bXBhcmUgdGhlIHJldHVybiB2YWx1ZSBkaXJlY3RseSB3aXRoIHRoZSBleHBlY3RlZA0KPiA+IG51
bWJlciBvZiBjb252ZXJzaW9ucyBpbnN0ZWFkIG9mIHN0b3JpbmcgaXQgaW4gcmV0IGFzIGFuIGVy
cm9yIGNvZGUuDQo+ID4NCj4gPiBBbHNvIHJlbW92ZSB0aGUgcmVkdW5kYW50IGVsc2UtaWYgY2hl
Y2sgZm9yIHNuZF9zb2NfZGFwbV9haWZfb3V0LiBUaGUNCj4gPiB3aWRnZXQgaWQgaXMgdmFsaWRh
dGVkIGVhcmxpZXIgaW4gdGhlIGZ1bmN0aW9uLCBzbyB0aGUgcmVtYWluaW5nIGJyYW5jaA0KPiA+
IGNhbiBvbmx5IGhhbmRsZSBzbmRfc29jX2RhcG1fYWlmX291dC4gVGhpcyBhdm9pZHMgYSBjb21w
aWxlciB3YXJuaW5nDQo+ID4gYWJvdXQgYSBwb3RlbnRpYWxseSB1bmluaXRpYWxpemVkIHZhcmlh
YmxlLg0KPiA+DQo+ID4gUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwu
Y29tPg0KPiA+IENsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb2Uta2J1aWxkLWFsbC8y
MDI2MDYxNDAzNDcuZ0dWV0RuYmktbGtwQGludGVsLmNvbS8NCj4gPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IGFiZGVsbmFzc2VyIGh1c3NlaW4gPGFiZGVsbmFzc2VyaHVzc2VpbjExQGdtYWlsLmNvbT4N
Cj4gPiAtLS0NCj4NCj4gVGhpcyBzdGF0aWMgY2hlY2tlciB3YXJuaW5nIGlzIHRyaWdnZXJlZCB3
aGVuIHdlIHByb3BhZ2F0ZSB0aGUgcmV0dXJuDQo+IGZyb20gc3NjYW5mKCkuDQo+DQo+ID4gIGRy
aXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2NvZGVjLmMgfCA1ICsrLS0tDQo+ID4gIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fY29kZWMuYyBiL2RyaXZlcnMv
c3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2NvZGVjLmMNCj4gPiBpbmRleCA3MjBhYTc1MmUxN2UuLjZk
YWE0ZTcwNjc5MiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRp
b19jb2RlYy5jDQo+ID4gKysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fY29kZWMu
Yw0KPiA+IEBAIC0zMTEsOCArMzExLDcgQEAgaW50IGdiYXVkaW9fbW9kdWxlX3VwZGF0ZShzdHJ1
Y3QgZ2JhdWRpb19jb2RlY19pbmZvICpjb2RlYywNCj4gPiAgICAgICB9DQo+ID4NCj4gPiAgICAg
ICAvKiBwYXJzZSBkYWlfaWQgZnJvbSBBSUYgd2lkZ2V0J3Mgc3RyZWFtX25hbWUgKi8NCj4gPiAt
ICAgICByZXQgPSBzc2NhbmYody0+c25hbWUsICIlcyAlZCAlcyIsIGludGZfbmFtZSwgJmRhaV9p
ZCwgZGlyKTsNCj4gPiAtICAgICBpZiAocmV0IDwgMykgew0KPiA+ICsgICAgIGlmIChzc2NhbmYo
dy0+c25hbWUsICIlcyAlZCAlcyIsIGludGZfbmFtZSwgJmRhaV9pZCwgZGlyKSAhPSAzKSB7DQo+
ID4gICAgICAgICAgICAgICBkZXZfZXJyKGNvZGVjLT5kZXYsICJFcnJvciB3aGlsZSBwYXJzaW5n
IGRhaV9pZCBmb3IgJXNcbiIsIHctPm5hbWUpOw0KPiA+ICAgICAgICAgICAgICAgcmV0dXJuIC1F
SU5WQUw7DQo+DQo+IFNvIHRoaXMgY29kZSBpcyBmaW5lIGFzLWlzIHNpbmNlIGl0J3MgcmV0dXJu
aW5nIC1FSU5WQUwuDQo+DQo+ID4gICAgICAgfQ0KPiA+IEBAIC0zMjMsNyArMzIyLDcgQEAgaW50
IGdiYXVkaW9fbW9kdWxlX3VwZGF0ZShzdHJ1Y3QgZ2JhdWRpb19jb2RlY19pbmZvICpjb2RlYywN
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gZ2JhdWRpb19tb2R1bGVfZW5hYmxlX3R4
KGNvZGVjLCBtb2R1bGUsIGRhaV9pZCk7DQo+ID4gICAgICAgICAgICAgICBlbHNlDQo+ID4gICAg
ICAgICAgICAgICAgICAgICAgIHJldCA9IGdiYXVkaW9fbW9kdWxlX2Rpc2FibGVfdHgobW9kdWxl
LCBkYWlfaWQpOw0KPiA+IC0gICAgIH0gZWxzZSBpZiAody0+aWQgPT0gc25kX3NvY19kYXBtX2Fp
Zl9vdXQpIHsNCj4gPiArICAgICB9IGVsc2Ugew0KPg0KPiBZZXMsIHRoaXMgaXMgd2hhdCB0aGUg
c3RhdGljIGNoZWNrZXIgaXMgY29tcGxhaW5pbmcgYWJvdXQuICBJdCB0aGlua3MNCj4gdGhhdCB0
aGUgaWYgc3RhdGVtZW50IG1pZ2h0IGJlIGZhbHNlLiAgQnV0IHRvIGEgaHVtYW4gcmVhZGVyLCB0
aGUNCj4gZWxzZSBpZiBvciB0aGUgcGxhaW4gZWxzZSBhcmUgZXF1aXZhbGVudC4gIEl0J3MganVz
dCBhIHN0eWxlIGNob2ljZQ0KPiB3aGljaCB3YXkgdG8gd3JpdGUgaXQuDQo+DQo+IEkgd291bGQg
anVzdCBsZWF2ZSB0aGlzIGFzLWlzIHNpbmNlIHRoZSBvcmlnaW5hbCBjb2RlIGlzIGZpbmUuICBU
byBiZQ0KPiBob25lc3QsIG1vc3Qgb2xkIHN0YXRpYyBjaGVja2VyIHdhcm5pbmdzIGFyZSBzdHVm
ZiB0aGF0IHNvbWVvbmUNCj4gYWxyZWFkeSBkZWNpZGVkIHRvIGxlYXZlIGFzIGlzLg0KPg0KPiBJ
dCdzIGJldHRlciB0byB3cml0ZSBuZXcgY2hlY2tzLiAgSnVzdCBsb29rIGZvciBzaW1wbGUgZml4
ZXMgaW4gZ2l0DQo+IGxvZyBhbmQgdGhlbiB5b3UgY2FuIHZpYmUgY29kZSBhIGNoZWNrLiAgQmV0
dGVyIHRvIHdvcmsgYWdhaW5zdCB0aGUNCj4gZGV2ZWwgYnJhbmNoIG9mIHNtYXRjaC4NCj4NCj4g
cmVnYXJkcywNCj4gZGFuIGNhcnBlbnRlcg0KPg0KPiA+ICAgICAgICAgICAgICAgaWYgKGVuYWJs
ZSkNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gZ2JhdWRpb19tb2R1bGVfZW5hYmxl
X3J4KGNvZGVjLCBtb2R1bGUsIGRhaV9pZCk7DQo+ID4gICAgICAgICAgICAgICBlbHNlDQo+DQo+
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVz
LWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1
YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5v
cmcK
