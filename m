Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D46C3106B
	for <lists+greybus-dev@lfdr.de>; Tue, 04 Nov 2025 13:40:31 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1D69D3F826
	for <lists+greybus-dev@lfdr.de>; Tue,  4 Nov 2025 12:40:31 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.14])
	by lists.linaro.org (Postfix) with ESMTPS id 818A33F858
	for <greybus-dev@lists.linaro.org>; Tue,  4 Nov 2025 11:55:30 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=web.de header.s=s29768273 header.b="j1c/B+k5";
	dmarc=pass (policy=quarantine) header.from=web.de;
	spf=pass (lists.linaro.org: domain of Markus.Elfring@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=Markus.Elfring@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1762257328; x=1762862128; i=markus.elfring@web.de;
	bh=a7X2ieoeeBHhik2NMBWS0hcX92nNKZ41XvQ5qCU+rds=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=j1c/B+k5+GeVLFZTGzZKLFwdVvG9rIMKYswIxThl2YCVOctj9FGxOYkJmACDung2
	 XZcjKz5hBdzarHV6KN/UkfYCPMmO7lgIAWAf5dYMLSWIzB1/BL1rFZJhejOHoTar6
	 TzXYf6uay5dUX4G04LLxTjvuSeoGaL0nOUwOyWu2zaFs90lu3xtBwGfOwzNfVDhbC
	 xpxOs+2hq7N/fnAOl9Fmi95zcJHyimTQVGRNZZdkhNxsJEBZKQpaYCPwukaOIfqKg
	 s1dTgWx3D6hDcqBOwwJS+XmRyCI552wRDIWdRLynU+dEOpYzxIg9q/p8vgYv79sx+
	 Kf/42pcwcjL5Xa5duw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.227]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N62yi-1wHoZE2Baa-00v8mi; Tue, 04
 Nov 2025 12:55:28 +0100
Message-ID: <14b7e79c-6863-4cb6-a7c0-f4d7a01c39bc@web.de>
Date: Tue, 4 Nov 2025 12:55:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Johan Hovold <johan@kernel.org>, greybus-dev@lists.linaro.org
References: <b542b028-4f9b-44cd-aca7-5d4977c2faa4@web.de>
 <aQnmfCKoB3FJ5Jz8@hovoldconsulting.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <aQnmfCKoB3FJ5Jz8@hovoldconsulting.com>
X-Provags-ID: V03:K1:vKLwVHeGwqaRD3NTFs76Ql7209GdsQ7uV/SSakVBW0pRPtSFXUI
 dWZFk7NICniOe/fQHTgdf4aRTzDOAfvg81qCVY6myAi6JW36Zo7CXlqd8CKdqJFvS2k39+K
 Yw4qArPsF9/uUr6n33E2MEaMd/oZjAI5hOHUgnleFI2GGrjeugaqxHsP+2jv8oNupAPlVLV
 j5ZJ5bKIXIoabN145AdjQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:xzDtT2TcH2s=;yQVUiJj23IkPWI9+RUr/glZbIXD
 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
 RKso5NniP8SrlCEwq0V7FePcqg=
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 818A33F858
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.47 / 15.00];
	BAYES_HAM(-2.47)[97.62%];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	RWL_MAILSPIKE_VERYGOOD(-0.20)[212.227.15.14:from];
	ONCE_RECEIVED(0.20)[];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	R_SPF_ALLOW(-0.20)[+a:mout.web.de];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[web.de:+];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,vger.kernel.org,animalcreek.com,gmail.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:8560, ipnet:212.227.0.0/16, country:DE];
	FREEMAIL_FROM(0.00)[web.de];
	DNSWL_BLOCKED(0.00)[94.31.92.227:received,212.227.15.14:from];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[web.de:dkim];
	FREEMAIL_ENVFROM(0.00)[web.de]
X-Rspamd-Action: no action
X-MailFrom: Markus.Elfring@web.de
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 55FALEXPPUK4WIFP7ESGRZZYYWVW7ABU
X-Message-ID-Hash: 55FALEXPPUK4WIFP7ESGRZZYYWVW7ABU
X-Mailman-Approved-At: Tue, 04 Nov 2025 12:40:25 +0000
CC: Alex Elder <elder@kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Miaoqian Lin <linmq006@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: greybus: es2: Use pointer from memcpy() call for assignment in output_async()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/55FALEXPPUK4WIFP7ESGRZZYYWVW7ABU/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> Since you know how to work with Coccinelle, at least try to come up with
> something that fixes actual bugs.

I became curious how development interests and resources will evolve further
for such more advanced source code reviews.

Regards,
Markus
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
