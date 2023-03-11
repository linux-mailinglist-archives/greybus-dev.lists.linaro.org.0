Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4E56B5D1C
	for <lists+greybus-dev@lfdr.de>; Sat, 11 Mar 2023 16:01:08 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 18A1F3F4A4
	for <lists+greybus-dev@lfdr.de>; Sat, 11 Mar 2023 15:01:07 +0000 (UTC)
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	by lists.linaro.org (Postfix) with ESMTPS id 8A0773F032
	for <greybus-dev@lists.linaro.org>; Sat, 11 Mar 2023 15:01:00 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=inria.fr header.s=dc header.b=eTeZwr7P;
	spf=pass (lists.linaro.org: domain of julia.lawall@inria.fr designates 192.134.164.83 as permitted sender) smtp.mailfrom=julia.lawall@inria.fr;
	dmarc=pass (policy=none) header.from=inria.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=YBUynlOgBjxt0gAz68NH0YicKE7loSO8V0u9I7YN1Es=;
  b=eTeZwr7PtjHXE7dM/E9YuM00QTvMzyhs+uJe6TFMuqrlxG6TwugZsj+N
   P+tmFLA6wLSFS04HeenButOp928cENkhmF92KZfCXtonIH5jBgmKfa5cl
   GNVLwgRzi/PbCJC/Ouh2p8NEEF3URDPepWfwRV+00POF+gvQ4Yr6JoxHm
   8=;
X-IronPort-AV: E=Sophos;i="5.98,252,1673910000";
   d="scan'208";a="96650250"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 16:00:58 +0100
Date: Sat, 11 Mar 2023 16:00:59 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
In-Reply-To: <c9ae27dc-3538-5432-6a6d-3e2ff034f467@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2303111600330.2802@hadrien>
References: <20230311135919.9129-1-eng.mennamahmoud.mm@gmail.com> <10d2c15b-ff9f-4634-a013-7640c93435a7@kili.mountain> <c9ae27dc-3538-5432-6a6d-3e2ff034f467@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1157779403-1678546859=:2802"
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 8A0773F032
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	CTYPE_MIXED_BOGUS(1.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RCVD_IN_DNSWL_HI(-0.50)[192.134.164.83:from];
	DMARC_POLICY_ALLOW(-0.50)[inria.fr,none];
	R_SPF_ALLOW(-0.20)[+ip4:192.134.164.0/24];
	R_DKIM_ALLOW(-0.20)[inria.fr:s=dc];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	FREEMAIL_CC(0.00)[gmail.com,lists.linux.dev,nexus-software.ie,kernel.org,linuxfoundation.org,lists.linaro.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	ASN(0.00)[asn:2200, ipnet:192.134.164.0/24, country:FR];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[inria.fr:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_COUNT_TWO(0.00)[2]
Message-ID-Hash: V7PZOHEBKX5MJSUI6HZ3VBY4TNWXBPB7
X-Message-ID-Hash: V7PZOHEBKX5MJSUI6HZ3VBY4TNWXBPB7
X-MailFrom: julia.lawall@inria.fr
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Dan Carpenter <error27@gmail.com>, outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: eclose macro in a do - while loop
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/V7PZOHEBKX5MJSUI6HZ3VBY4TNWXBPB7/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1157779403-1678546859=:2802
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCk9uIFNhdCwgMTEgTWFyIDIwMjMsIE1lbm5hIE1haG1vdWQgd3JvdGU6DQoNCj4NCj4gT24g
2aHZoS/Zoy/Zotmg2aLZoyDZodmmOtmg2aYsIERhbiBDYXJwZW50ZXIgd3JvdGU6DQo+ID4gT24g
U2F0LCBNYXIgMTEsIDIwMjMgYXQgMDM6NTk6MTlQTSArMDIwMCwgTWVubmEgTWFobW91ZCB3cm90
ZToNCj4gPiA+ICIgRVJST1I6IE1hY3JvcyB3aXRoIG11bHRpcGxlIHN0YXRlbWVudHMgc2hvdWxk
IGJlIGVuY2xvc2VkIGluIGEgZG8gLQ0KPiA+ID4gd2hpbGUgbG9vcCINCj4gPiA+DQo+ID4gPiBS
ZXBvcnRlZCBieSBjaGVja3BhdGguDQo+ID4gPg0KPiA+ID4gZG8gbG9vcCB3aXRoIHRoZSBjb25k
aXRpb25hbCBleHByZXNzaW9uIHNldCB0byBhIGNvbnN0YW50DQo+ID4gPiB2YWx1ZSBvZiB6ZXJv
ICgwKS5UaGlzIGNyZWF0ZXMgYSBsb29wIHRoYXQNCj4gPiA+IHdpbGwgZXhlY3V0ZSBleGFjdGx5
IG9uZSB0aW1lLlRoaXMgaXMgYSBjb2RpbmcgaWRpb20gdGhhdA0KPiA+ID4gYWxsb3dzIGEgbXVs
dGktbGluZSBtYWNybyB0byBiZSB1c2VkIGFueXdoZXJlDQo+ID4gPiB0aGF0IGEgc2luZ2xlIHN0
YXRlbWVudCBjYW4gYmUgdXNlZC4NCj4gPiA+DQo+ID4gPiBTbywgZW5jbG9zZSBgZ2JfbG9vcGJh
Y2tfc3RhdHNfYXR0cnNgIG1hY3JvIGluIGRvIC0gd2hpbGUgKDApIHRvDQo+ID4gPiBmaXggY2hl
Y2twYXRoIGVycm9yDQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogTWVubmEgTWFobW91ZCA8
ZW5nLm1lbm5hbWFobW91ZC5tbUBnbWFpbC5jb20+DQo+ID4gPiAtLS0NCj4gPiBUaGlzIGJyZWFr
cyB0aGUgYnVpbGQuICBZb3UgbmVlZCB0byBjb21waWxlIHRoZSBjb2RlIGJlZm9yZSBzZW5kaW5n
IGENCj4gPiBwYXRjaC4NCj4gPg0KPiA+IHJlZ2FyZHMsDQo+ID4gZGFuIGNhcnBlbnRlcg0KPg0K
Pg0KPiBJIHNlZSwgSSB0aG91Z2h0IGJ1aWxkaW5nIHRoZSBmaWxlIG9ubHkgZW5vdWdoLiBhcHBy
ZWNpYXRlIHlvdXIgZmVlZGJhY2suDQoNClRoZSBvdXRyZWFjaHkgdHV0b3JpYWwgZXhwbGFpbnMg
aG93IHRvIGNvbXBpbGUgZXZlcnl0aGluZyBpbiBhDQpzdWJkaXJlY3RvcnkuDQoNCmp1bGlh

--8323329-1157779403-1678546859=:2802
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--8323329-1157779403-1678546859=:2802--
