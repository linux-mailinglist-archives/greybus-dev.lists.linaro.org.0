Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id E36C62D759C
	for <lists+greybus-dev@lfdr.de>; Fri, 11 Dec 2020 13:29:54 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B28AA6670B
	for <lists+greybus-dev@lfdr.de>; Fri, 11 Dec 2020 12:29:53 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id A4B5B6670F; Fri, 11 Dec 2020 12:29:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 029216670D;
	Fri, 11 Dec 2020 12:29:37 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id E5AD3607F0
 for <greybus-dev@lists.linaro.org>; Fri, 11 Dec 2020 12:29:34 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id CDF986670C; Fri, 11 Dec 2020 12:29:34 +0000 (UTC)
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by lists.linaro.org (Postfix) with ESMTPS id 7F049607F0
 for <greybus-dev@lists.linaro.org>; Fri, 11 Dec 2020 12:29:32 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CsqpG5zp9z7CWs;
 Fri, 11 Dec 2020 20:28:54 +0800 (CST)
Received: from [10.174.179.81] (10.174.179.81) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.487.0; Fri, 11 Dec 2020 20:29:23 +0800
To: Johan Hovold <johan@kernel.org>
References: <20201205103827.31244-1-wanghai38@huawei.com>
 <X89IxvbYWjuyaQDT@localhost>
From: "wanghai (M)" <wanghai38@huawei.com>
Message-ID: <ed57715b-c524-4726-3eaf-434af96d2d92@huawei.com>
Date: Fri, 11 Dec 2020 20:29:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <X89IxvbYWjuyaQDT@localhost>
X-Originating-IP: [10.174.179.81]
X-CFilter-Loop: Reflected
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, elder@kernel.org, linux-kernel@vger.kernel.org,
 aibhav.sr@gmail.com, greybus-dev@lists.linaro.org, dan.carpenter@oracle.com
Subject: Re: [greybus-dev] [PATCH] staging: greybus: audio: Fix possible
 leak free widgets in gbaudio_dapm_free_controls
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.16
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8087640334355598044=="
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

--===============8087640334355598044==
Content-Type: multipart/alternative;
	boundary="------------6473E56B7E4D1A091CE82F35"

--------------6473E56B7E4D1A091CE82F35
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


在 2020/12/8 17:35, Johan Hovold 写道:
> On Sat, Dec 05, 2020 at 06:38:27PM +0800, Wang Hai wrote:
>> In gbaudio_dapm_free_controls(), if one of the widgets is not found, an error
>> will be returned directly, which will cause the rest to be unable to be freed,
>> resulting in leak.
>>
>> This patch fixes the bug. If if one of them is not found, just skip and free the others.
> Apart from the typo, please break your lines at 72 columns or so (not
> needed for the Fixes tag).
Thanks for review,  Do I need to send a v2 patch to change the commit msg?

>> Fixes: 510e340efe0c ("staging: greybus: audio: Add helper APIs for dynamic audio module")
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: Wang Hai <wanghai38@huawei.com>
>> ---
>>   drivers/staging/greybus/audio_helper.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/staging/greybus/audio_helper.c b/drivers/staging/greybus/audio_helper.c
>> index 237531ba60f3..3011b8abce38 100644
>> --- a/drivers/staging/greybus/audio_helper.c
>> +++ b/drivers/staging/greybus/audio_helper.c
>> @@ -135,7 +135,8 @@ int gbaudio_dapm_free_controls(struct snd_soc_dapm_context *dapm,
>>   		if (!w) {
>>   			dev_err(dapm->dev, "%s: widget not found\n",
>>   				widget->name);
>> -			return -EINVAL;
>> +			widget++;
>> +			continue;
>>   		}
>>   		widget++;
>>   #ifdef CONFIG_DEBUG_FS
> Not sure if we can ever have the widget lookup fail, but at least this
> looks consistent now.
>
> Reviewed-by: Johan Hovold <johan@kernel.org>
>
> Johan
> .
>

--------------6473E56B7E4D1A091CE82F35
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">在 2020/12/8 17:35, Johan Hovold 写道:<br>
    </div>
    <blockquote type="cite" cite="mid:X89IxvbYWjuyaQDT@localhost">
      <pre class="moz-quote-pre" wrap="">On Sat, Dec 05, 2020 at 06:38:27PM +0800, Wang Hai wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">In gbaudio_dapm_free_controls(), if one of the widgets is not found, an error
will be returned directly, which will cause the rest to be unable to be freed,
resulting in leak.

This patch fixes the bug. If if one of them is not found, just skip and free the others.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Apart from the typo, please break your lines at 72 columns or so (not
needed for the Fixes tag).
</pre>
    </blockquote>
    Thanks for review,  Do I need to send a v2 patch to change the
    commit msg?<br class="Apple-interchange-newline">
    <br>
    <blockquote type="cite" cite="mid:X89IxvbYWjuyaQDT@localhost">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Fixes: 510e340efe0c ("staging: greybus: audio: Add helper APIs for dynamic audio module")
Reported-by: Hulk Robot <a class="moz-txt-link-rfc2396E" href="mailto:hulkci@huawei.com">&lt;hulkci@huawei.com&gt;</a>
Signed-off-by: Wang Hai <a class="moz-txt-link-rfc2396E" href="mailto:wanghai38@huawei.com">&lt;wanghai38@huawei.com&gt;</a>
---
 drivers/staging/greybus/audio_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/audio_helper.c b/drivers/staging/greybus/audio_helper.c
index 237531ba60f3..3011b8abce38 100644
--- a/drivers/staging/greybus/audio_helper.c
+++ b/drivers/staging/greybus/audio_helper.c
@@ -135,7 +135,8 @@ int gbaudio_dapm_free_controls(struct snd_soc_dapm_context *dapm,
 		if (!w) {
 			dev_err(dapm-&gt;dev, "%s: widget not found\n",
 				widget-&gt;name);
-			return -EINVAL;
+			widget++;
+			continue;
 		}
 		widget++;
 #ifdef CONFIG_DEBUG_FS
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Not sure if we can ever have the widget lookup fail, but at least this
looks consistent now.

Reviewed-by: Johan Hovold <a class="moz-txt-link-rfc2396E" href="mailto:johan@kernel.org">&lt;johan@kernel.org&gt;</a>

Johan
.

</pre>
    </blockquote>
  </body>
</html>

--------------6473E56B7E4D1A091CE82F35--

--===============8087640334355598044==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1k
ZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0
cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK

--===============8087640334355598044==--
