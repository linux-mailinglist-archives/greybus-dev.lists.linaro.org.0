Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAA58629B6
	for <lists+greybus-dev@lfdr.de>; Sun, 25 Feb 2024 09:33:36 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 89A2F4402E
	for <lists+greybus-dev@lfdr.de>; Sun, 25 Feb 2024 08:33:35 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by lists.linaro.org (Postfix) with ESMTPS id D36D43F3B7
	for <greybus-dev@lists.linaro.org>; Sun, 25 Feb 2024 08:33:27 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=SrwdVzOf;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 145.40.73.55 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6CB0ACE0F1B;
	Sun, 25 Feb 2024 08:33:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13B3BC433F1;
	Sun, 25 Feb 2024 08:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1708850004;
	bh=6hgAzKoh0X8Vc/PxuhnIWRzdvMEeWy6T9l/qi5QFODY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SrwdVzOfqd39q8MknfoPT1MJBqXSmE+Jqa3cvGdq571eBG8OqIpJ/+3NR2koZdB99
	 Kg0OLwXYXR2wUthYisXnjlweeu0+Ahb73Hp0iprI26+t3Nfnsy9if0y51jjm4vWfeh
	 kgvJErhgUrN3nRiRrEMlCDHK3XW/c7ja6kpCX+HA=
Date: Sun, 25 Feb 2024 09:33:22 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Message-ID: <2024022553-deepness-sublevel-73de@gregkh>
References: <20240219-device_cleanup-greybus-v1-1-babb3f65e8cc@marliere.net>
 <cf5b2696-d7ca-40fc-856a-52f352cd270c@ieee.org>
 <ids3525jm5zkwkgizt2xtg3do37kqqtfdy5gc2cptdduexoe7r@cr4yxh3tykkh>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ids3525jm5zkwkgizt2xtg3do37kqqtfdy5gc2cptdduexoe7r@cr4yxh3tykkh>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: D36D43F3B7
X-Spamd-Bar: /
X-Spamd-Result: default: False [0.50 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:145.40.73.55];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:54825, ipnet:145.40.73.0/24, country:US];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_IN_DNSWL_FAIL(0.00)[100.75.92.58:server fail];
	DNSWL_BLOCKED(0.00)[145.40.73.55:from];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
Message-ID-Hash: P2UQ2DOZ7MC3VBJUCPXIQ4UQWZYL7PNB
X-Message-ID-Hash: P2UQ2DOZ7MC3VBJUCPXIQ4UQWZYL7PNB
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: constify the struct device_type usage
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/P2UQ2DOZ7MC3VBJUCPXIQ4UQWZYL7PNB/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Feb 24, 2024 at 05:22:39PM -0300, Ricardo B. Marliere wrote:
> On 24 Feb 09:43, Alex Elder wrote:
> > On 2/19/24 6:40 AM, Ricardo B. Marliere wrote:
> > > Since commit aed65af1cc2f ("drivers: make device_type const"), the driver
> > > core can properly handle constant struct device_type. Move the
> > > greybus_hd_type, greybus_module_type, greybus_interface_type,
> > > greybus_control_type, greybus_bundle_type and greybus_svc_type variables to
> > > be constant structures as well, placing it into read-only memory which can
> > > not be modified at runtime.
> > > 
> > > Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
> > 
> > This looks good to me.  Assuming it compiles cleanly:
> > 
> > Reviewed-by: Alex Elder <elder@linaro.org>
> 
> Hi Alex!
> 
> Thanks for reviewing.
> 
> > 
> > On another subject:
> > 
> > Johan might disagree, but I think it would be nice to make
> > the definitions of the Greybus device types as static (private)
> > and make the is_gb_host_device() etc. functions real functions
> > rather than static inlines in <linux/greybus.h>.
> > 
> > It turns out that all of the is_gb_*() functions are called only
> > from drivers/greybus/core.c; they could all be moved there rather
> > than advertising them in <linux/greybus.h>.
> 
> I guess it depends whether they would be used somewhere else in the
> future. Perhaps it was left there with that intention when it was first
> being developed? I agree, though. Will happily send a patch with this if
> desired.

Let's clean the code up for what we have today.  If it's needed in the
future, we can move the structures then.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
