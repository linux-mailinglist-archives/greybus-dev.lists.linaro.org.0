Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7026CF865
	for <lists+greybus-dev@lfdr.de>; Thu, 30 Mar 2023 02:53:44 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 03EC63F6FF
	for <lists+greybus-dev@lfdr.de>; Thu, 30 Mar 2023 00:53:44 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	by lists.linaro.org (Postfix) with ESMTPS id 8A3EE3E975
	for <greybus-dev@lists.linaro.org>; Wed, 29 Mar 2023 22:35:03 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=wdc.com header.s=dkim.wdc.com header.b=q3tRgohy;
	dkim=pass header.d=opensource.wdc.com header.s=dkim header.b=Zok4WYhc;
	spf=pass (lists.linaro.org: domain of "prvs=44543d287=damien.lemoal@opensource.wdc.com" designates 216.71.154.42 as permitted sender) smtp.mailfrom="prvs=44543d287=damien.lemoal@opensource.wdc.com";
	dmarc=pass (policy=quarantine) header.from=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1680129303; x=1711665303;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=8mC4BypXl60HzEDMOes6JdsHqZokNKJxPcubhfSExuE=;
  b=q3tRgohyuZ6967cZxMXz9gDRqryegIfR/VBUZjDFK8dTWT2UckuOO+AB
   UzqlrS3O1BVda6raySgPEeWIVzT2ik2zOomcbqKWt5YLY8P2GEAZA0+Ue
   RJNlH39pFPHkw5R/S6pV+1KkCYYbeSQRJIZfAiLldAzO7e6VZrsV4NrKj
   BXOHHcyTRTyStJ/bZBpKUkjw/o543fWyVoF7svFDr3oGGmJQsIIkODjWK
   W0fmRTU7LZrNKtOFat8J3BHOBkCezEAgBSleLJ5EnuUrZM/Z2TvWRDWCc
   2ULZVwsg5CM3uhF+v/guTBy1SMiReinzrlAUNL9LGFpsrxv3DW7NlqQpj
   g==;
X-IronPort-AV: E=Sophos;i="5.98,301,1673884800";
   d="scan'208";a="225110846"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 30 Mar 2023 06:35:01 +0800
IronPort-SDR: 2InsHK4O2FHSfYp2F0Jpqe3zQkMpF86Q6L1fDmC9eRyU/IxBClXuM7OiI112RJe+XvnpujuLN1
 Olf1H29yN0yz1rMzafGdhDB+mCrsfnWHV6MYXzYpZs/5fJOIfF/mEaCVCHm39YgD4fQpWPN/aT
 GNz8hoxzhBOnyL2BxFRJ5+1AZvu5+GMDWEDQm7KB5bQZsktS5e6Lujgxuxq0QwcyG5E1ERspEY
 umjkiA0ZZYyOPFzAgjpQsPvtOapwX7Cd3qKmb5PFtNKBh/cGXHH93Ev+fhQZ4/g9jh7ISMGAEH
 0VU=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 29 Mar 2023 14:51:10 -0700
IronPort-SDR: ahfIDkvQwpZjFEmK1R6c3W7+vTTfmi+mdlanIBMGNSWmnKQxh5WRpmLtjnBlBSUmxko9VXvIX/
 PRBjdF2jBuEWUI7d8gpoplFNgHxgnP7vdjHla4h698nTNWkyLiwgl+6ueMz59M0v760QlYFF26
 o7+WYRf3xSR/lQ+w4L91ALRc29CpyxP2QCTTxCaAiHTqX68aMDVPMFMqAisQtMzz80b9DK+W7w
 6zfm3fti7EV1BBoNpDC1lgrIQCwfL/ryXiETLbGmcPqC+gvuz+GvtCO99WHpOPuQY5D6/qLz+K
 nAc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 29 Mar 2023 15:35:01 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Pn1Zs0g7Rz1RtVn
	for <greybus-dev@lists.linaro.org>; Wed, 29 Mar 2023 15:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1680129300; x=1682721301; bh=8mC4BypXl60HzEDMOes6JdsHqZokNKJxPcu
	bhfSExuE=; b=Zok4WYhcroENZvLPiiffuiL0wIhaaRMSE93p6mIUiG5P1+ftd2L
	q1g4BSW3yDCKYTtjxpyxP4yTyI5aihR+osGu3NHW33Fq3jncg3Qe7xNY4F/zwHCv
	etW1Nmc+YdHa6MKI4hd5xELhEGqsNDzfy7V+nuAUqZ9fc7RzMMfrtfJiNcSB4ANF
	pv7W16xNgr9XsLPJlP+2wNhoirGRaSfwNKtWLeK1SbCOjj5Lw5yzhhURWBT08bOc
	VuNZw5622X4vF6VjgAxro3fJgQJCUlPlSKztiYuxIJWi6gMTBHsKGitpZ4T4QUfn
	usPw+D9cS59VkGHy8R3Zh6mURJpGmFM4MSw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id wWsn-i-M1LYp for <greybus-dev@lists.linaro.org>;
	Wed, 29 Mar 2023 15:35:00 -0700 (PDT)
Received: from [10.225.163.116] (unknown [10.225.163.116])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Pn1Zq4BbJz1RtVm;
	Wed, 29 Mar 2023 15:34:59 -0700 (PDT)
Message-ID: <18c3fbb4-59db-d508-ddd6-080cc8944b39@opensource.wdc.com>
Date: Thu, 30 Mar 2023 07:34:58 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: =?UTF-8?B?5a2Z5rui?= <sunying@nj.iscas.ac.cn>, linux-ide@vger.kernel.org,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-mips@vger.kernel.org
References: <bc6c86d.11bb9.1872c5aa2cb.Coremail.sunying@nj.iscas.ac.cn>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <bc6c86d.11bb9.1872c5aa2cb.Coremail.sunying@nj.iscas.ac.cn>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 8A3EE3E975
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-8.18 / 15.00];
	DWL_DNSWL_HI(-3.50)[wdc.com:dkim];
	BAYES_HAM(-2.98)[99.93%];
	RCVD_DKIM_ARC_DNSWL_MED(-0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[opensource.wdc.com,quarantine];
	R_DKIM_ALLOW(-0.20)[wdc.com:s=dkim.wdc.com,opensource.wdc.com:s=dkim];
	RCVD_IN_DNSWL_MED(-0.20)[216.71.154.42:from];
	R_SPF_ALLOW(-0.20)[+exists:216.71.154.42.spf.hgst.iphmx.com];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_VERP_SRS(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[damien.lemoal@opensource.wdc.com,prvs=44543d287=damien.lemoal@opensource.wdc.com];
	DKIM_TRACE(0.00)[wdc.com:+,opensource.wdc.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:16417, ipnet:216.71.154.0/23, country:US];
	NEURAL_HAM(-0.00)[-0.999]
X-MailFrom: prvs=44543d287=damien.lemoal@opensource.wdc.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: SFHK5K4TTU5AJPBHZMSGOILFKSRCAKFF
X-Message-ID-Hash: SFHK5K4TTU5AJPBHZMSGOILFKSRCAKFF
X-Mailman-Approved-At: Thu, 30 Mar 2023 00:53:35 +0000
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: Multiple undefined configuration options are dependent in Kconfig under the v6.3-rc4 drivers directory
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/SFHK5K4TTU5AJPBHZMSGOILFKSRCAKFF/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gMy8yOS8yMyAxNjo1Miwg5a2Z5ruiIHdyb3RlOg0KPiBJdCBoYXMgYmVlbiBkaXNjb3ZlcmVk
IHRoYXQgdGhlIGZvbGxvd2luZyBjb25maWd1cmF0aW9uIG9wdGlvbnMgYXJlIHVuZGVmaW5lZCBp
biB0aGUgY3VycmVudCBsYXRlc3QgdmVyc2lvbiwgdjYuMy1yYzQsIHlldCB0aGV5IGFyZSBiZWlu
ZyByZWxpZWQgdXBvbiBieSBvdGhlciBjb25maWd1cmF0aW9uIG9wdGlvbnMgaW4gbXVsdGlwbGUg
S2NvbmZpZyBmaWxlczoNCj4gDQo+IE1JUFNfQkFJS0FMX1QxIGlzIHVuZGVmaW5lZCwgdXNlZCBh
cyBhICdkZXBlbmRzIG9uJyBjb25kaXRpb24gaW4gbXVsdGlwbGUgZmlsZXMgc3VjaCBhcyBkcml2
ZXJzL2F0YS9LY29uZmlnLCBkcml2ZXJzL2h3bW9uL0tjb25maWcsIGRyaXZlcnMvYnVzL0tjb25m
aWcsIGFuZCBkcml2ZXJzL21lbW9yeS9LY29uZmlnLg0KPiBNRkRfTUFYNTk3WCBpcyB1bmRlZmlu
ZWQsIHVzZWQgYXMgYSAnZGVwZW5kcyBvbicgY29uZGl0aW9uIGluIEtjb25maWcgZmlsZSBkcml2
ZXJzL3JlZ3VsYXRvci9LY29uZmlnLg0KPiBNRkRfU001NzAzIGlzIHVuZGVmaW5lZCwgdXNlZCBh
cyBhICdkZXBlbmRzIG9uJyBjb25kaXRpb24gaW4gS2NvbmZpZyBmaWxlIGRyaXZlcnMvcmVndWxh
dG9yL0tjb25maWcuDQo+IEFSQ0hfVEhVTkRFUkJBWSBpcyB1bmRlZmluZWQsIHVzZWQgYXMgYSAn
ZGVwZW5kcyBvbicgY29uZGl0aW9uIGluIEtjb25maWcgZmlsZXMgZHJpdmVycy9waW5jdHJsL0tj
b25maWcgYW5kIGRyaXZlcnMvcGh5L2ludGVsL0tjb25maWcuDQo+IEFSQ0hfQkNNNDkwOCBpcyB1
bmRlZmluZWQsIHVzZWQgYXMgYSAnZGVwZW5kcyBvbicgY29uZGl0aW9uIGluIEtjb25maWcgZmls
ZSBkcml2ZXJzL2xlZHMvYmxpbmsvS2NvbmZpZy4NCj4gTUZEX1RONDhNX0NQTEQgaXMgdW5kZWZp
bmVkLCB1c2VkIGFzIGEgJ2RlcGVuZHMgb24nIGNvbmRpdGlvbiBpbiBLY29uZmlnIGZpbGVzIGRy
aXZlcnMvZ3Bpby9LY29uZmlnIGFuZCBkcml2ZXJzL3Jlc2V0L0tjb25maWcuIA0KPiBVU0JfSFNJ
Q19VU0IzNjEzIGlzIHVuZGVmaW5lZCwgdXNlZCBhcyBhICdkZXBlbmRzIG9uJyBjb25kaXRpb24g
aW4gZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvS2NvbmZpZyBhbmQgZHJpdmVycy9zdGFnaW5nL2dy
ZXlidXMvYXJjaGUtcGxhdGZvcm0uYy4NCj4gDQo+IElmIHRoZXNlIDcgY29uZmlndXJhdGlvbiBv
cHRpb25zIGFyZSBkZXByZWNhdGVkLCBpdCBpcyByZWNvbW1lbmRlZCB0byByZW1vdmUgdGhlIGRl
cGVuZGVuY2llcyBvbiB0aGVtIGluIHRoZSBLY29uZmlnIGZpbGVzLiANCj4gSWYgdGhleSBhcmUg
c3RpbGwgdXNlZnVsLCBpdCBpcyByZWNvbW1lbmRlZCB0byBkZWZpbmUgdGhlbS4NCg0KKyBsaW51
eC1hcm0gJiBsaW51eC1taXBzDQoNCldoYXQgYWJvdXQgeW91IHNlbmQgcGF0Y2hlcyB0byBmaXgg
dGhpcyA/DQoNCj4gDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IFlpbmcgU3VuDQo+IFBlbmdwZW5n
IEhvdQ0KPiBZYW5qaWUgUmVuDQoNCi0tIA0KRGFtaWVuIExlIE1vYWwNCldlc3Rlcm4gRGlnaXRh
bCBSZXNlYXJjaA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJv
Lm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxp
c3RzLmxpbmFyby5vcmcK
