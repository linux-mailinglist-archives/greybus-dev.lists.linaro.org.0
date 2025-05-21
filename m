Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E9DABEB45
	for <lists+greybus-dev@lfdr.de>; Wed, 21 May 2025 07:30:50 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 25F8145935
	for <lists+greybus-dev@lfdr.de>; Wed, 21 May 2025 05:30:49 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 9887240D24
	for <greybus-dev@lists.linaro.org>; Wed, 21 May 2025 05:30:43 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=F8OJvwhj;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CB7C45C4BAF;
	Wed, 21 May 2025 05:28:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 000BAC4CEE7;
	Wed, 21 May 2025 05:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747805442;
	bh=xxzoGcyYX27jqtcoky1rcuhuide78j57u85KKUybaIg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F8OJvwhjKjk8UQePqdjsxhwv2A+sgfggmp0+qQ42TuPpIlivYNlco3w6KJarEQGK+
	 KWGtEdzUTbCu8SWn3q6i/F54PyT5ZJKp4JG01hVvg7uAH1mkMlUBE4vnqHRZW9LJdf
	 TOLhMVWVDaY48vVwghZSGqnFbgC1cjefT+lsBf1E=
Date: Wed, 21 May 2025 07:30:39 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: rujra <braker.noob.kernel@gmail.com>
Message-ID: <2025052116-diaphragm-payback-a3ef@gregkh>
References: <CAG+54DZYz-4hW33Py9mihHDauWw55=_rP71s1MbCg-5gxw7J7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAG+54DZYz-4hW33Py9mihHDauWw55=_rP71s1MbCg-5gxw7J7Q@mail.gmail.com>
X-Spam-Level: ***
X-Spamd-Result: default: False [3.69 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	BAYES_HAM(-1.31)[90.19%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	URIBL_BLOCKED(0.00)[linuxfoundation.org:dkim];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	DNSWL_BLOCKED(0.00)[139.178.84.217:from];
	TAGGED_RCPT(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[linuxfoundation.org:dkim];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 9887240D24
X-Spamd-Bar: +++
Message-ID-Hash: 2HKYNXACQDZWZTZO3SXT24NWB4JLE3KM
X-Message-ID-Hash: 2HKYNXACQDZWZTZO3SXT24NWB4JLE3KM
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH RESEND] staging : greybus : Documentation : firmware : Replace deprecated strncpy() with strscpy()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/2HKYNXACQDZWZTZO3SXT24NWB4JLE3KM/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, May 21, 2025 at 10:26:52AM +0530, rujra wrote:
> To ensure that the firmware tag is properly null-terminated. When
> copying firmware tag strings to prevent buffer overflows and ensure
> data integrity.
> 
> 
> changes has been made in 3 positions:
> 1: update firmware tag
> 2: backend update firmware tag
> 3: backend update firmware tag with unipro
> 
> Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>

Your From: line does not match this :(

Also, why is this a "RESEND"?

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
