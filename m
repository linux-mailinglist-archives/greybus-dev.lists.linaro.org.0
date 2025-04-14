Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 14301A88627
	for <lists+greybus-dev@lfdr.de>; Mon, 14 Apr 2025 17:01:31 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 202A9460EF
	for <lists+greybus-dev@lfdr.de>; Mon, 14 Apr 2025 15:01:30 +0000 (UTC)
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	by lists.linaro.org (Postfix) with ESMTPS id BDA3B450A9
	for <greybus-dev@lists.linaro.org>; Mon, 14 Apr 2025 15:00:55 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linux.dev header.s=key1 header.b=Gg2pbYMP;
	spf=pass (lists.linaro.org: domain of thorsten.blum@linux.dev designates 95.215.58.181 as permitted sender) smtp.mailfrom=thorsten.blum@linux.dev;
	dmarc=pass (policy=none) header.from=linux.dev
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744642854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e4j8O/8ZHu8onOaKP9iGDUgsNXP6aniA46e0vk4sRAw=;
	b=Gg2pbYMPki5MNKxZxI/W8oEEQZd4Bzbn+rjcmbhOBZMfe2qbOZn9XWgeTkYLdizQS//hSe
	XEch+HoxGjy87bemeTPTX3EH/z4+sb1tf8P812zIrLF21ZH7aarlq1ArY32x65HlwWc0wS
	BT8L80r8UbuUAKYRSS8NnF0nkfw5wwU=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.2\))
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <Z_yztGweLAfJgwXh@hovoldconsulting.com>
Date: Mon, 14 Apr 2025 17:00:41 +0200
Message-Id: <BF2CF4C6-5381-4266-9E49-9C81E9604007@linux.dev>
References: <20250413104802.49360-2-thorsten.blum@linux.dev>
 <Z_yztGweLAfJgwXh@hovoldconsulting.com>
To: Johan Hovold <johan@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Queue-Id: BDA3B450A9
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-8.50 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	RBL_SENDERSCORE_REPUT_9(-1.00)[95.215.58.181:from];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:95.215.58.0/24];
	RCVD_IN_DNSWL_LOW(-0.10)[95.215.58.181:from];
	ONCE_RECEIVED(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:202172, ipnet:95.215.58.0/24, country:CH];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_ZERO(0.00)[0];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.941];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: thorsten.blum@linux.dev
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: SNAONL4NXX4VGZJQLSODGH3PJHNMSQTN
X-Message-ID-Hash: SNAONL4NXX4VGZJQLSODGH3PJHNMSQTN
X-Mailman-Approved-At: Mon, 14 Apr 2025 15:01:24 +0000
CC: Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: Reformat code in gb_operation_sync_timeout()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/SNAONL4NXX4VGZJQLSODGH3PJHNMSQTN/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 14. Apr 2025, at 09:05, Johan Hovold wrote:
> This just makes the code *less* readable.

I guess you prefer the code with curly braces?

What about the Linux kernel coding style [1]? Specifically "Do not
unnecessarily use braces where a single statement will do."

My patch just removes any unnecessary curly braces, resulting in less
lines of code and no line break in the memcpy() arguments.

Thanks,
Thorsten

[1] https://docs.kernel.org/process/coding-style.html#placing-braces-and-spaces

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
