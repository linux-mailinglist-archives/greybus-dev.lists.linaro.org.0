Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 51ECE7C030B
	for <lists+greybus-dev@lfdr.de>; Tue, 10 Oct 2023 19:55:19 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 577A13F584
	for <lists+greybus-dev@lfdr.de>; Tue, 10 Oct 2023 17:55:18 +0000 (UTC)
Received: from mailo.com (msg-4.mailo.com [213.182.54.15])
	by lists.linaro.org (Postfix) with ESMTPS id 7E1123F23D
	for <greybus-dev@lists.linaro.org>; Fri,  6 Oct 2023 13:12:08 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=mailo.com header.s=mailo header.b="mif+BjF/";
	spf=pass (lists.linaro.org: domain of drv@mailo.com designates 213.182.54.15 as permitted sender) smtp.mailfrom=drv@mailo.com;
	dmarc=pass (policy=none) header.from=mailo.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1696597926; bh=bpFnRu/wSLaJ36e2cl256f9SsrE5uKGcDH1qTSECnRU=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=mif+BjF/RrX5QmfsFXDVzq1+LjM6YDhcbbFGCbpo7r/S/YgH+cCF4bAf24tPOiVsB
	 CbC8kp7ztBLFm6NePvANL8dXzHtqIGtVclbNxornv9JAO9dEG3elKRBZ3oMrWBwrl7
	 85RScX+L/ucfbQdwv4niVTIFhdDtcLcHBG2gkmZ0=
Received: by b221-2.in.mailobj.net [192.168.90.22] with ESMTP
	via ip-20.mailobj.net [213.182.54.20]
	Fri,  6 Oct 2023 15:12:06 +0200 (CEST)
X-EA-Auth: vQHFtkQs5JwsO7pjZoUof/uBK5tNUlViDT4elZhpx7PPqUypgNv2GuvWR2ovBDzoWwk5+rN1GRS7JKpvG0VRxg==
Date: Fri, 6 Oct 2023 18:42:00 +0530
From: Deepak R Varma <drv@mailo.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <ZSAHoIN8p2ROXvh/@runicha.com>
References: <2023100533-broadband-hunk-9e91@gregkh>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2023100533-broadband-hunk-9e91@gregkh>
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-8.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[mailo.com,none];
	R_DKIM_ALLOW(-0.20)[mailo.com:s=mailo];
	R_SPF_ALLOW(-0.20)[+ip4:213.182.54.0/24];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:8304, ipnet:213.182.32.0/19, country:FR];
	NEURAL_HAM(-0.00)[-1.000];
	URIBL_BLOCKED(0.00)[linaro.org:email,linuxfoundation.org:email];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[mailo.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 7E1123F23D
X-MailFrom: drv@mailo.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: DHA3EVVE5RRXOJCEPZQ6TWIMGIIMGN6U
X-Message-ID-Hash: DHA3EVVE5RRXOJCEPZQ6TWIMGIIMGN6U
X-Mailman-Approved-At: Tue, 10 Oct 2023 17:55:10 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 1/3] staging: greybus: raw: make raw_class constant
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/DHA3EVVE5RRXOJCEPZQ6TWIMGIIMGN6U/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 05, 2023 at 03:58:34PM +0200, Greg Kroah-Hartman wrote:
> Now that the driver core allows for struct class to be in read-only

Hello Greg,
When you say "Now", has anything changed recently that facilitates this
improvement? Where can I read more about this change?

Thank you,
deepak.

> memory, making all 'class' structures to be declared at build time
> placing them into read-only memory, instead of having to be dynamically
> allocated at load time.
> 
> Cc: Johan Hovold <johan@kernel.org>
> Cc: Alex Elder <elder@kernel.org>
> Cc: greybus-dev@lists.linaro.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---


_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
