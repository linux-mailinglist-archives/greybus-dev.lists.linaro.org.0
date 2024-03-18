Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C1487EFBB
	for <lists+greybus-dev@lfdr.de>; Mon, 18 Mar 2024 19:29:19 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 694BA40E13
	for <lists+greybus-dev@lfdr.de>; Mon, 18 Mar 2024 18:29:18 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.17.11])
	by lists.linaro.org (Postfix) with ESMTPS id 9B7DC3F326
	for <greybus-dev@lists.linaro.org>; Mon, 18 Mar 2024 18:12:49 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=web.de header.s=s29768273 header.b=DtiAJ4mL;
	dmarc=pass (policy=quarantine) header.from=web.de;
	spf=pass (lists.linaro.org: domain of Markus.Elfring@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=Markus.Elfring@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1710785542; x=1711390342; i=markus.elfring@web.de;
	bh=Lac3YRJkU4gFApnJTCBqCe0z/9YKT7CxPuYov4fasoY=;
	h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:
	 In-Reply-To;
	b=DtiAJ4mL+fiMEmlLYNE+iHg/3zZ03m+na+DnFX9rNp0X8vC3m1YzzzfbqIbNUz4M
	 Dt/DoYRZ0bTHZMXQhjGQI5H+aW5q/a5zWyI2OiPdDqCrEIY13lTnnTv64UmgOhJlP
	 AdP1de9DaQxLPmVPhHjOMruAxmUu8IjvBxqgt1t6o6/JqA2aLA8ttQPPqZgEPNpVd
	 nnPPPOBzYznZLns/h1E7VD70fWADr5hWWCz4+RfWiMZaxts+7fOHzhLOJi0dCa8xQ
	 1WhA2QoKteLDviVFmPYk2hYl3ekUd1OQ3YXoY7bsM5TWPGLkVHKXgzMZZteTc6bIV
	 SZWCtywFzYFN47nToA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MqIFF-1r0cvV1ZHH-00nKIM; Mon, 18
 Mar 2024 19:12:22 +0100
Message-ID: <d5efc400-8dbc-4aee-9fb5-2993e6830e2c@web.de>
Date: Mon, 18 Mar 2024 19:12:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ayush Singh <ayushdevel1325@gmail.com>,
 Vaishnav M A <vaishnav@beagleboard.org>, devicetree@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, lorforlinux@beagleboard.org,
 greybus-dev@lists.linaro.org
References: <20240317193714.403132-5-ayushdevel1325@gmail.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240317193714.403132-5-ayushdevel1325@gmail.com>
X-Provags-ID: V03:K1:d3rsWjua/euVmCusMEdf9EWPGyz5EyJVackRp6jiopEEya/axKM
 7KtTisuDqOjT7g+BpfBqQUwvkJdzBesfLFecqA+eroXI5usXRM1yMhefzveu38JXth+ok/K
 9memp43OQwwmFTM+1S32xqzmjH/zYdRag8frGqdD+AMSRfF6t28WhqRCmDHj5Qt7AtzUka7
 533VbMOvhlXUEbK3I4QyQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:FOAv7gLOqbk=;LIFw7TE+o2L/aes12HD1LR9Y1I0
 VDIjhJs70jys6vXqjVzsgrWtqrEk9pchL9A+mGrUuU99U2rzuYEvJe3Tp0/WZpfS7FCgkZt6n
 wf4MuB3QnaDd3jyAg6wfQFcWpPpzY2mJUXIsFtteJWmXX8LxUf84i6opANHArV6uPrTgW1Bt8
 ye49vSH5h8mLrS5Egj+E7vN+eTIpzd3pr0XqiOjpEvUeXtGjj/AD53pnNayTJy8s8PsfW9/+Q
 8amXd2uh1sYJX6GK1MqiJHlaRy33xCM69nyFSCNOqHzFCbrR1BqGddY7yKRALti7PUmdUTe7p
 5Q5I2FcCXUoI6HQburx4jGu1ftlbnqcpp/0FdKovJI95vXuxYf7RIuDad8S5vz0Yyt84Rb8Wr
 G/tGX7Qvs6dgatLzJlUQLjfJ3jd/wzjfB1j3QFpAiIuef8TUmvokOgPESnwR96E7H2c/Ul6j+
 q7BB1qJD1+B+GF4520sj1KEIsePWDJrlvGb/DRgyYkHBxAFHmIfEPfxR8YVHQMw+U3FvWMLcv
 mnxV4xtKtb/7cklHsq3MY09j55UNMdKEhngLtNn8Ua1Ion3GAWEqv4tA1+bL07hm6nCfinpeU
 tIA/Z3AFQMJ/LM+kKDJZQd8PmaZCY52VMv5YnxybipwTuwOK3E3DuJHYQH9btP8v7746qxjuH
 2C/xWUSp6SGrPueZ+BvTReM5nrolHLfNQUl9cMU9gCl9buwICLJYiuQtu+jDn6QKiBDkyrife
 Lj0OzKfxvNPeK8h2fp+zxep8H/B417sLSJpY4Fy1zJIr+jNxaiAsSgLeoOjgpFRQZHylw4n6o
 e1HDP836GHMfIfjaEKUq9QklADBV+IztnZKY+buyRd+Bs=
X-Rspamd-Queue-Id: 9B7DC3F326
X-Spamd-Bar: -----
X-Spamd-Result: default: False [-5.58 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-2.09)[95.55%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	R_SPF_ALLOW(-0.20)[+a:mout.web.de];
	ONCE_RECEIVED(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[212.227.17.11:from];
	XM_UA_NO_VERSION(0.01)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,beagleboard.org,vger.kernel.org,lists.infradead.org,lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_FROM(0.00)[web.de];
	TAGGED_RCPT(0.00)[dt];
	ASN(0.00)[asn:8560, ipnet:212.227.0.0/16, country:DE];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[web.de:+];
	RCVD_COUNT_ONE(0.00)[1];
	FREEMAIL_ENVFROM(0.00)[web.de]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: Markus.Elfring@web.de
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 4A374CVMDE67PPPMEINFFIS4NTHUSLBD
X-Message-ID-Hash: 4A374CVMDE67PPPMEINFFIS4NTHUSLBD
X-Mailman-Approved-At: Mon, 18 Mar 2024 18:28:58 +0000
CC: LKML <linux-kernel@vger.kernel.org>, Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Conor Dooley <conor+dt@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Johan Hovold <johan@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Mark Brown <broonie@kernel.org>, Nishanth Menon <nm@ti.com>, Rob Herring <robh@kernel.org>, Robert Nelson <robertcnelson@beagleboard.org>, Tero Kristo <kristo@kernel.org>, Vaishnav M A <vaishnav.a@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 4/5] mikrobus: Add mikroBUS driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/4A374CVMDE67PPPMEINFFIS4NTHUSLBD/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

4oCmDQo+ICsrKyBiL2RyaXZlcnMvbWlzYy9taWtyb2J1cy9taWtyb2J1c19jb3JlLmgNCuKApg0K
PiArI2lmbmRlZiBfX01JS1JPQlVTX0gNCj4gKyNkZWZpbmUgX19NSUtST0JVU19IDQrigKYNCg0K
SSBzdWdnZXN0IHRvIGF2b2lkIHRoZSBzcGVjaWZpY2F0aW9uIG9mIGxlYWRpbmcgdW5kZXJzY29y
ZXMgZm9yIGluY2x1ZGUgZ3VhcmRzLg0KDQpTZWUgYWxzbzoNCmh0dHBzOi8vd2lraS5zZWkuY211
LmVkdS9jb25mbHVlbmNlL2Rpc3BsYXkvYy9EQ0wzNy1DLitEbytub3QrZGVjbGFyZStvcitkZWZp
bmUrYStyZXNlcnZlZCtpZGVudGlmaWVyI0RDTDM3Qy5Eb25vdGRlY2xhcmVvcmRlZmluZWFyZXNl
cnZlZGlkZW50aWZpZXItTm9uY29tcGxpYW50Q29kZUV4YW1wbGUlMjhJbmNsdWRlR3VhcmQlMjkN
Cg0KDQpSZWdhcmRzLA0KTWFya3VzDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlz
dHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2
LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
