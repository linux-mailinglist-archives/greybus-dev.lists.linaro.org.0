Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 976377CB27F
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Oct 2023 20:27:20 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9E1183F977
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Oct 2023 18:27:19 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by lists.linaro.org (Postfix) with ESMTPS id 0E78D3EC22
	for <greybus-dev@lists.linaro.org>; Mon, 16 Oct 2023 18:27:11 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=chO7d19k;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 145.40.68.75 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 255ECB81851;
	Mon, 16 Oct 2023 18:27:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E37DCC433C9;
	Mon, 16 Oct 2023 18:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697480829;
	bh=CZKFTo/eXqsrRit9MNwv0cU1pOUbuT2NJ1NQnZ3ahIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=chO7d19ktURDkpR0GHIawPTf8J6AFU/TJ2qVNrcAQXYN9BpipEjE3rRP53Zd2yj3G
	 R4B79jS7otadqcZ7wvjwVHMUI0dbwGpTHNP6v0u8vySaFiMRGmh9NKQDDF40NVG2yI
	 iBviN0wswuB+A/6xQNOJseF8ALY4kN43swCEURh8=
Date: Mon, 16 Oct 2023 20:27:06 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Chen Shuo <1289151713@qq.com>
Message-ID: <2023101642-grappling-baguette-5002@gregkh>
References: <tencent_4AA25FB21AB5C203873443FE188956134B09@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_4AA25FB21AB5C203873443FE188956134B09@qq.com>
X-Spamd-Bar: /
X-Spamd-Result: default: False [0.50 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:145.40.68.75];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:54825, ipnet:145.40.68.0/24, country:US];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[qq.com];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 0E78D3EC22
Message-ID-Hash: CVQR7YIE6CCC46MDIM2TD7FMESIGFZBY
X-Message-ID-Hash: CVQR7YIE6CCC46MDIM2TD7FMESIGFZBY
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] [PATCH] staging: greybus: camera: fixes alignment should match open parenthesis
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/CVQR7YIE6CCC46MDIM2TD7FMESIGFZBY/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 12, 2023 at 08:50:21PM +0800, Chen Shuo wrote:
> This patch fixes the checks reported by checkpatch.pl
> for alignment should match open parenthesis

No it doesn't :(

Also, please always use scripts/checkpatch.pl to get the proper mailing
lists to send patches to.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
