Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F77B9C000B
	for <lists+greybus-dev@lfdr.de>; Thu,  7 Nov 2024 09:35:16 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 37C2A401C4
	for <lists+greybus-dev@lfdr.de>; Thu,  7 Nov 2024 08:35:15 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	by lists.linaro.org (Postfix) with ESMTPS id 15E50442F6
	for <greybus-dev@lists.linaro.org>; Thu,  7 Nov 2024 08:34:57 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=b5+O+zck;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 147.75.193.91 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 05108A4295E;
	Thu,  7 Nov 2024 08:33:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ACB8C4CECC;
	Thu,  7 Nov 2024 08:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1730968496;
	bh=H1TzH86HG0FbCIerlbUTkX8qGUQsiEnVFyJfnigUSrc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b5+O+zckGBQ7sVu+YNczqIWKY5xMv731nv0DfLq651dyspohSQ2C4o5HiLxe7bZFP
	 HKo/z4C0zXdj+Q7GAe56jyktmLLk67SAZ7AUgKaQiZQPnhrZdOyPNx7iwtYOZ9nqpV
	 V9xKiYOPTlZtREUT/AlhiGy0IWQhiYCFY4O1TWzs=
Date: Thu, 7 Nov 2024 09:29:18 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Qiu-ji Chen <chenqiuji666@gmail.com>
Message-ID: <2024110706-stammer-brought-662c@gregkh>
References: <20241106095819.15194-1-chenqiuji666@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241106095819.15194-1-chenqiuji666@gmail.com>
X-Spamd-Result: default: False [-4.19 / 15.00];
	REPLY(-4.00)[];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-2.69)[98.62%];
	RBL_SENDERSCORE_REPUT_9(-1.00)[147.75.193.91:from];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:147.75.193.91];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:54825, ipnet:147.75.192.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 15E50442F6
X-Spamd-Bar: ----
Message-ID-Hash: NM26LGPFTWVINO63AGEAE74KL5A3DY4V
X-Message-ID-Hash: NM26LGPFTWVINO63AGEAE74KL5A3DY4V
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: dtwlin@gmail.com, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, baijiaju1990@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] greybus/uart: Fix atomicity violation in get_serial_info()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/NM26LGPFTWVINO63AGEAE74KL5A3DY4V/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 06, 2024 at 05:58:19PM +0800, Qiu-ji Chen wrote:
> Our static checker found a bug where set_serial_info() uses a mutex, but 
> get_serial_info() does not. Fortunately, the impact of this is relatively 
> minor. It doesn't cause a crash or any other serious issues. However, if a 
> race condition occurs between set_serial_info() and get_serial_info(), 
> there is a chance that the data returned by get_serial_info() will be 
> meaningless.

You have trailing whitespace in your changelog text for some reason :(

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
