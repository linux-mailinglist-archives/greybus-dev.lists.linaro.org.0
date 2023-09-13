Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 1865D79E86F
	for <lists+greybus-dev@lfdr.de>; Wed, 13 Sep 2023 14:58:04 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F35673F06F
	for <lists+greybus-dev@lfdr.de>; Wed, 13 Sep 2023 12:58:02 +0000 (UTC)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	by lists.linaro.org (Postfix) with ESMTPS id 4285F3EE13
	for <greybus-dev@lists.linaro.org>; Wed, 13 Sep 2023 12:57:56 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=beagleboard-org.20230601.gappssmtp.com header.s=20230601 header.b="LEzkXcm/";
	spf=pass (lists.linaro.org: domain of jkridner@gmail.com designates 209.85.221.177 as permitted sender) smtp.mailfrom=jkridner@gmail.com;
	dmarc=none
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-493545b4eaeso2368527e0c.0
        for <greybus-dev@lists.linaro.org>; Wed, 13 Sep 2023 05:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1694609876; x=1695214676; darn=lists.linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UtrxdtTp1EW7h6+dg/+5k5x050r9bil5U5brlIW9E/E=;
        b=LEzkXcm/FEYUwlMm3dGPy8khqux/cBt8WfK68O5eJUp5HvifX2KSl0PCeX7zRnuoVE
         GTAABSBOFhzUUs2QWyHxfULFqYH9AX4gUPrKrk9c6tGgwygi/93p13gtLwrusYTp+idG
         Zi/1qKhoRtDmlM3haHWJVCt5aRDVImnRYX4JOm5bo2P/4NA83wqwBdXGpbPloWvT5EUm
         rUbFJxXqr/LlKFZzjLoqu1Bjq/Tkz0nDYYxGbxXQRX8CoalCo+/uVEUVjcGbw3kr2BLf
         Q4L8naRy//1d+OxlNEUi8XsTZy6rCzMi+t2DU/R2wAR7tlTKCwLBsS2ib/WUgkhUoRmV
         hbHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694609876; x=1695214676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UtrxdtTp1EW7h6+dg/+5k5x050r9bil5U5brlIW9E/E=;
        b=HCL48oof2pWIueyEjunJAi7BeA30WjowriebsNmLjtcGNqSWX3BlgcYq6HQMjzU+y2
         5UqTYbsS0oFbEhBX1OsoNw0++GQ5zBX0cybz9kpC8X/uXXqPGpXe5W6LJJVZHnPpdT13
         b3TNeUDuVldvny8EaX1l4WhFJ4Adlfb0zehiZwbPzUFAnTHyhuSilvMj92rE0+VP+yWQ
         MZINHZgId4z9mgkWoUk6AHZFxzwCw/kTtnuRZgE56/gbmebYXAtOR+JfcAr0Zuq0iNZ/
         KSu7sMe/QOAjhuCIptLQTSeQLJI7G1Mep23lDRMG+A0FOFSLMhiK0aioUofavytqWfDG
         lbsg==
X-Gm-Message-State: AOJu0YwOjTdWFzRv2e9C6wNYMr9UcLgFAE3nYgJ08GFmf82W7xQzPw5d
	P4CwbUSgEaNJOYw8RqjAwMb1D5kMO6aTXewwmJk=
X-Google-Smtp-Source: AGHT+IGBce9XpFUrQp4LmmTK00Ooh3AHj870mZ2euVBCDMHGPLWGSh+Dc6c9O1KrbGAnxc3aABrxwymZEOJokUcdp4w=
X-Received: by 2002:a1f:6d82:0:b0:493:7df9:bcc4 with SMTP id
 i124-20020a1f6d82000000b004937df9bcc4mr1747762vkc.4.1694609875558; Wed, 13
 Sep 2023 05:57:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230902182845.1840620-1-ayushdevel1325@gmail.com>
In-Reply-To: <20230902182845.1840620-1-ayushdevel1325@gmail.com>
From: Jason Kridner <jkridner@beagleboard.org>
Date: Wed, 13 Sep 2023 08:57:43 -0400
Message-ID: <CA+T6QP=gWS+7WzzyFmMtuN48cExThSQHXGgjAtQQsy_u-bhYDw@mail.gmail.com>
To: Ayush Singh <ayushdevel1325@gmail.com>
X-Rspamd-Queue-Id: 4285F3EE13
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.20 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	FORGED_SENDER(0.30)[jkridner@beagleboard.org,jkridner@gmail.com];
	R_DKIM_ALLOW(-0.20)[beagleboard-org.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.221.177:from];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[youtu.be:url,mail-vk1-f177.google.com:helo,mail-vk1-f177.google.com:rdns,beagleboard.org:url];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	DMARC_NA(0.00)[beagleboard.org];
	FROM_NEQ_ENVFROM(0.00)[jkridner@beagleboard.org,jkridner@gmail.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	NEURAL_HAM(-0.00)[-0.998];
	DKIM_TRACE(0.00)[beagleboard-org.20230601.gappssmtp.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: ZLH5INCQPV3YEYMVCW4V2R5CDMHFQOOA
X-Message-ID-Hash: ZLH5INCQPV3YEYMVCW4V2R5CDMHFQOOA
X-MailFrom: jkridner@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Vaishnav M A <vaishnav@beagleboard.org>, Nishanth Menon <nm@ti.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 0/3] greybus: Add BeaglePlay Greybus Driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ZLH5INCQPV3YEYMVCW4V2R5CDMHFQOOA/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gU2F0LCBTZXAgMiwgMjAyMyBhdCAyOjI44oCvUE0gQXl1c2ggU2luZ2ggPGF5dXNoZGV2ZWwx
MzI1QGdtYWlsLmNvbT4gd3JvdGU6DQo+DQo+IEJlYWdsZVBsYXkgaXMgYSBib2FyZCBieSBCZWFn
bGVCb2FyZC5vcmcuIEl0IGNvbnRhaW5zIGEgbWFpbiBBTTYyDQo+IHByb2Nlc3NvciB3aXRoIGEg
Q0MxMzUyIGNvLXByb2Nlc3Nvci4gVGhleSBhcmUgY29ubmVjdGVkIG92ZXIgVUFSVC4NCj4NCj4g
R3JleWJ1cyBpcyBhIGhhcmR3YXJlIHByb3RvY29sIHRoYXQgd2FzIGRlc2lnbmVkIHRvIHByb3Zp
ZGUgVW5pcHJvIHdpdGggYQ0KPiBzYW5lIGFwcGxpY2F0aW9uIGxheWVyLiBJdCBjYW4gYmUgdXNl
ZCBpbiBJT1QgYW5kIElJT1QgYXBwbGljYXRpb25zDQo+IGtlZXBpbmcgdGhlIGludGVsbGlnZW5j
ZSBvbiB0aGUgaG9zdC4NCj4NCj4gVGhpcyBkcml2ZXIgaGFzIGJlZW4gdGVzdGVkIG9uIEJlYWds
ZVBsYXkgYnkgQmVhZ2xlQm9hcmQub3JnLiBJdCBzZXJ2ZXMNCj4gYXMgR3JleWJ1cyBIb3N0IGRl
dmljZSBhbmQgY29tbXVuaWNhdGVzIHdpdGggQmVhZ2xlUGxheSBDQzEzNTINCj4gY28tcHJvY2Vz
c29yIHdoaWNoIHNlcnZlcyBhcyBHcmV5YnVzIFNWQy4gVGhpcyByZXBsYWNlcyB0aGUgb2xkIHNl
dHVwIHdpdGgNCj4gYmNmc2VyaWFsLCB3cGFudXNiIGFuZCBHQnJpZGdlLiBUaGlzIGRyaXZlciBh
bHNvIGNvbnRhaW5zIGFzeW5jIEhETEMgY29kZQ0KPiBzaW5jZSBjb21tdW5pY2F0aW9uIHdpdGgg
U1ZDIHRha2UgcGxhY2Ugb3ZlciBVQVJUIHVzaW5nIEhETEMuDQoNCkF5dXNoLA0KDQpJIHRoaW5r
IHBhcnQgb2YgdGhlIHByb2JsZW0geW91IGFyZSBzZWVpbmcgaW4gZ2V0dGluZyB0aGlzIHBhdGNo
IHNldA0KYWNjZXB0ZWQgaXMgZHVlIHRvIGEgbGFjayBvZiBjbGFyaXR5IGZyb20gbWUgb24gYnJh
bmRpbmcuIFllcywgdGhpcyBpcw0KYSBHcmV5YnVzIGRyaXZlciB0aGF0IHJ1bnMgb24gQmVhZ2xl
UGxheSBhbmQgdGFsa3MgdG8gc3BlY2lmaWMNCmZpcm13YXJlIHJ1bm5pbmcgb24gYSBDQzEzNTJQ
NyBvbiBCZWFnbGVQbGF5LCBidXQgbm9uZSBvZiB0aG9zZQ0KaW5kaXZpZHVhbCB0aGluZ3MgZXhw
bGFpbnMgd2hhdCB0aGlzIGlzIG9uIGl0cyBvd24sIGl0IGhhcyB0byBiZQ0KY29tcHJlaGVuZGVk
IGEgYml0IG1vcmUgY29sbGVjdGl2ZWx5LiBUb2dldGhlciwgSSd2ZSBiZWVuIGNhbGxpbmcgdGhp
cw0KdGhlICJCZWFnbGVDb25uZWN0IiBjb25jZXB0IGFuZCBJIG5lZWQgdG8gZG8gYSBiaXQgbW9y
ZSB0byBzbW9vdGggb3V0DQp0aGUgcm91Z2ggZWRnZXMgaW4gdGhlIGNvbW11bmljYXRpb25zLCBq
dXN0IGFzIHlvdSBoYXZlIHNtb290aGVkIG91dA0KdGhlIHJvdWdoIGVkZ2VzIGluIHRoZSBpbXBs
ZW1lbnRhdGlvbiBieSBtb3ZpbmcgR0JyaWRnZSBvdXQgb2YNCnVzZXJzcGFjZSBhbmQgbWFkZSBh
IHByb3BlciBHcmV5YnVzIGRyaXZlci4NCg0KSSBoYXZlIGEgZHJhZnQgb2YgdGhlIGNvbmNlcHQg
YXQNCmh0dHBzOi8vZG9jcy5iZWFnbGVib2FyZC5vcmcvbGF0ZXN0L2JvYXJkcy9iZWFnbGVjb25u
ZWN0L2luZGV4Lmh0bWwsDQpidXQgaXQgaXMgcmVhbGx5IGluIHJvdWdoIGZvcm0uIExldCBtZSB0
cnkgdG8gc3RhdGUgaXQgaGVyZSBmb3INCmNsYXJpdHkgYW5kIEkgdGhpbmsgeW91IG1pZ2h0IHBh
cmFwaHJhc2UgcGFydCBvZiBpdCBpbiB5b3VyIG5leHQgcGF0Y2gNCnNldCBhcyBJIHNlZSB5b3Un
dmUgaGFkIHNvbWUgY29tbWVudHMgdGhhdCBsaWtlbHkgbmVlZCB0byBiZSBhZGRyZXNzZWQNCnN1
Y2ggdGhhdCBhIHY1IHdpbGwgYmUgb24gdGhlIHdheS4NCg0KQmVhZ2xlQ29ubmVjdCBpcyBib3Ro
IGEgdGVjaG5vbG9neSBjb25jZXB0IGFuZCBhIGxpbmUgb2YgYm9hcmQgZGVzaWducw0KdGhhdCBp
bXBsZW1lbnQgdGhlIHRlY2hub2xvZ3kuIEJvcm4gZnJvbSBHcmV5YnVzLCBhIG1lY2hhbmlzbSBm
b3INCmR5bmFtaWNhbGx5IGV4dGVuZGluZyBhIExpbnV4IHN5c3RlbSB3aXRoIGVtYmVkZGVkIHBl
cmlwaGVyYWxzLA0KQmVhZ2xlQ29ubmVjdCBhZGRzIHR3byBrZXkgZWxlbWVudHM6IGEgNkxvV1BB
TiB0cmFuc3BvcnQgYW5kIG1pa3JvQlVTDQptYW5pZmVzdHMuIFRoZSA2TG9XUEFOIHRyYW5zcG9y
dCBwcm92aWRlcyBmb3IgYXJiaXRyYXJ5IGNvbm5lY3Rpb25zLA0KaW5jbHVkaW5nIHRoZSBJRUVF
ODAyLjE1LjRnIGxvbmctcmFuZ2Ugd2lyZWxlc3MgdHJhbnNwb3J0IHN1cHBvcnRlZA0KYmV0d2Vl
biBCZWFnbGVQbGF5IGFuZCBCZWFnbGVDb25uZWN0IEZyZWVkb20gKHRoZSBmaXJzdCBCZWFnbGVD
b25uZWN0DQpib2FyZCBkZXNpZ24pLiBUaGUgbWlrcm9CVVMgbWFuaWZlc3RzIHByb3ZpZGUgZm9y
IHJhcGlkIHByb3RvdHlwaW5nDQphbmQgbG93LW5vZGUtY291bnQgcHJvZHVjdGlvbiB3aXRoIHNl
bnNvciBib2FyZHMgZm9sbG93aW5nIHRoZQ0KbWlrcm9CVVMgZnJlZWx5LWxpY2Vuc2FibGUgZW1i
ZWRkZWQgYnVzIHN0YW5kYXJkIHN1Y2ggdGhhdCBleGlzdGluZw0KTGludXggZHJpdmVycyBjYW4g
YmUgbG9hZGVkIHVwb24gR3JleWJ1cyBkaXNjb3Zlcnkgb2YgdGhlIG5vZGVzLg0KDQpUaGlzIHBh
dGNoIHNldCBwcm92aWRlcyB0aGUgTGludXgtc2lkZSBob29rcyByZXF1aXJlZCBmb3IgdGhlIDZM
b1dQQU4NCnRyYW5zcG9ydCBmb3IgQmVhZ2xlQ29ubmVjdCBvbiBCZWFnbGVQbGF5LiBBIGRpZmZl
cmVudCBwYXRjaCBzZXQsDQpjdXJyZW50bHkgaW4gUkZDLCBwcm92aWRlcyB0aGUgbWlrcm9CVVMg
bWFuaWZlc3Qgc3VwcG9ydCB0byBjb21wbGV0ZQ0KdGhlIEJlYWdsZUNvbm5lY3QgZnVuY3Rpb25h
bGl0eS4gKEJlIHN1cmUgdG8gdXNlIGltcGVyYXRpdmUgbW9kZSBpZg0KcGFyYXBocmFzaW5nIHRo
aXMgaW4gdGhlIHBhdGNoIHN1Ym1pc3Npb24pLg0KDQooSWYgd29uZGVyaW5nLCBCZWFnbGUgaGFz
bid0IGRvbmUgYW55IHBhdGVudCBhcHBsaWNhdGlvbnMgYW5kDQpjb25zaWRlcnMgYWxsIHB1Ymxp
YyByZWNvcmQgb2YgZGVzY3JpYmluZyBCZWFnbGVDb25uZWN0IHRlY2hub2xvZ3kgYXMNCmV2aWRl
bmNlIG9mIHByaW9yIGFydCBpbiBwdWJsaWMgdGhhdCB3aWxsIGhvcGVmdWxseSBwcmV2ZW50IGFu
eW9uZQ0KZWxzZSBmcm9tIHRyeWluZyB0byBwYXRlbnQgaXQuIFRoZSBuYW1lIEJlYWdsZUNvbm5l
Y3QgaXMgYSB0cmFkZW1hcmsNCm93bmVkIGJ5IHRoZSBCZWFnbGVCb2FyZC5vcmcgRm91bmRhdGlv
biwgYnV0IGFueW9uZSBzaG91bGQgbmF0dXJhbGx5DQpiZSBhYmxlIHRvIGltcGxlbWVudCBHcmV5
YnVzIG92ZXIgNkxvV1BBTiB3aXRob3V0IGFueSBzb3J0IG9mDQpyb3lhbHR5LS13ZSBqdXN0IG5l
ZWQgdG8gY2FsbCBpdCBzb21ldGhpbmcgc28gdGhhdCBwZW9wbGUgY2FuDQpyZWNvZ25pemUgY29t
cGF0aWJsZSBkZXZpY2VzLCBzbyBkb24ndCBpbXBsZW1lbnQgYW55dGhpbmcgdGhhdCBpc24ndA0K
aW50ZXJvcGVyYWJsZSBhbmQgY2FsbCBpdCBCZWFnbGVDb25uZWN0LCBwbGVhc2UuKQ0KDQpXaXRo
IHRoaXMgc2FpZCwgbWF5YmUgdGhlIG5hbWVzIGNhbiBiZSBhIGJpdCBtb3JlIGNsZWFyPyBJZiBJ
IGhhdmVuJ3QNCmRlZmluZWQgdGVybXMgd2VsbCBlbm91Z2gsIGxldCBtZSBrbm93Lg0KDQpTbywg
d2hlbiBuYW1pbmcgdGhlIGJpbmRpbmcsIEknZCB0aGluayBzb21ldGhpbmcgbGlrZQ0KImJlYWds
ZSxwbGF5LWNjMTM1Mi1jb25uZWN0aG9zdCIuIEkgcmVtb3ZlZCB0aGUgcmVkdW5kYW50IHVzZSBv
Zg0KImJlYWdsZSIgaWYgdGhhdCBzZWVtcyByaWdodC4gSSB0aGluayBpdCBpcyBhY2N1cmF0ZSBm
cm9tIGENCmhpZXJhcmNoaWNhbCBwZXJzcGVjdGl2ZSBiZWNhdXNlIGl0IHJ1bnMgb24gQmVhZ2xl
UGxheSwgaXQgdGFsa3MgdG8NCnRoZSBjYzEzNTIgYW5kIHRoZSBjYzEzNTIgbmVlZHMgdG8gYmUg
cnVubmluZyB0aGUgQmVhZ2xlQ29ubmVjdCBob3N0DQpmaXJtd2FyZS4NCg0KSG9wZSB0aGlzIGhl
bHBzLg0KDQotLUphc29uDQooQm9hcmQgcHJlc2lkZW50IGF0IEJlYWdsZUJvYXJkLm9yZyBGb3Vu
ZGF0aW9uKQ0KDQo+DQo+IFRoaXMgZHJpdmVyIGhhcyBiZWVuIGNyZWF0ZWQgYXMgYSBwYXJ0IG9m
IG15IEdvb2dsZSBTdW1tZXIgb2YgQ29kZSAyMDIzLg0KPiBGb3IgbW9yZSBpbmZvcm1hdGlvbiwg
dGFrZSBhIGxvb2sgYXQgbXkgYmxvZy4NCj4NCj4gVGhpcyBwYXRjaHNldCBoYXMgYmVlbiB0ZXN0
ZWQgb3ZlciBgbmV4dC0yMDIzMDgyNWAuDQo+DQo+IE15IEdTb0MyMyBCbG9nOiBodHRwczovL3By
b2dyYW1tZXJzaGlkZWF3YXkueHl6L3RhZ3MvZ3NvYzIzLw0KPiBaZXBoeXIgQXBwOiBodHRwczov
L2dpdC5iZWFnbGVib2FyZC5vcmcvZ3NvYy9ncmV5YnVzL2NjMTM1Mi1maXJtd2FyZQ0KPiBHaXRI
dWIgQnJhbmNoOiBodHRwczovL2dpdGh1Yi5jb20vQXl1c2gxMzI1L2xpbnV4L3RyZWUvZ2ItYmVh
Z2xlcGxheQ0KPiBWaWRlbyBEZW1vOiBodHRwczovL3lvdXR1LmJlL0dWdUlCN2k1cGprDQo+DQo+
IFRoaXMgdGhlIHY0IG9mIHRoaXMgcGF0Y2gNCj4gdjMgLT4gdjQ6DQo+IC0gQWRkIERUIEJpbmRp
bmdzDQo+IC0gUmVvcmRlciBjb21taXRzDQo+IC0gSW1wcm92ZSBjb21taXQgbWVzc2FnZXMNCj4N
Cj4gdjIgLT4gdjM6DQo+IC0gTW92ZSBnYi1iZWFnbGVwbGF5IG91dCBvZiBzdGFnaW5nDQo+DQo+
IHYxIC0+IHYyOg0KPiAtIENvbWJpbmUgdGhlIGRyaXZlciBpbnRvIGEgc2luZ2xlIGZpbGUNCj4g
LSBSZW1vdmUgcmVkdW5kYW50IGNvZGUNCj4gLSBGaXggQ2hlY2twYXRjaCBjb21wbGFpbnRzDQo+
IC0gT3RoZXIgc3VnZ2VzdGVkIGNoYW5nZXMNCj4NCj4gQXl1c2ggU2luZ2ggKDMpOg0KPiAgIGR0
LWJpbmRpbmdzOiBBZGQgYmVhZ2xlY2MxMzUyDQo+ICAgZ3JleWJ1czogQWRkIEJlYWdsZVBsYXkg
TGludXggRHJpdmVyDQo+ICAgZHRzOiB0aTogazMtYW02MjUtYmVhZ2xlcGxheTogQWRkIGJlYWds
ZWNjMTM1Mg0KPg0KPiAgLi4uL2JpbmRpbmdzL3NlcmlhbC9iZWFnbGVjYzEzNTIueWFtbCAgICAg
ICAgIHwgIDI1ICsNCj4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAgNyArDQo+ICAuLi4vYXJtNjQvYm9vdC9kdHMvdGkvazMtYW02MjUtYmVhZ2xlcGxh
eS5kdHMgfCAgIDQgKw0KPiAgZHJpdmVycy9ncmV5YnVzL0tjb25maWcgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDEwICsNCj4gIGRyaXZlcnMvZ3JleWJ1cy9NYWtlZmlsZSAgICAgICAgICAgICAg
ICAgICAgICB8ICAgMyArLQ0KPiAgZHJpdmVycy9ncmV5YnVzL2diLWJlYWdsZXBsYXkuYyAgICAg
ICAgICAgICAgIHwgNDk0ICsrKysrKysrKysrKysrKysrKw0KPiAgNiBmaWxlcyBjaGFuZ2VkLCA1
NDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zZXJpYWwvYmVhZ2xlY2MxMzUyLnlhbWwN
Cj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dyZXlidXMvZ2ItYmVhZ2xlcGxheS5jDQo+
DQo+IC0tDQo+IDIuNDEuMA0KPg0KDQoNCi0tIA0KaHR0cHM6Ly9iZWFnbGVib2FyZC5vcmcvYWJv
dXQvamtyaWRuZXIgLSBhIDUwMWMzIG5vbi1wcm9maXQgZWR1Y2F0aW5nDQphcm91bmQgb3BlbiBo
YXJkd2FyZSBjb21wdXRpbmcNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5s
aW5hcm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVh
dmVAbGlzdHMubGluYXJvLm9yZwo=
