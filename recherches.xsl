<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    <xsl:param name="value"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Résultats XML Search</title>
                
                <style>
                    body {
                    margin: 50px;
                    font-family: 'Segoe UI', Arial, sans-serif;
                    
                    color: #e8eaed;
                   
                    }
                    
                    .container1 {
                    max-width: 900px;
                    margin: 50px auto;
                    padding: 20px;
                    
                    height: 100vh;        
                    overflow-y: auto;    
                    overflow-x: hidden; 
                    }

                    
                    h2 {
                    font-size: 22px;
                    margin-bottom: 40px;
                    text-align: center;
                    color: #42f4df;
                    text-shadow: 0 0 15px rgba(66,244,223,0.6);
                    }
                    
                    .result {
                    background: rgba(255,255,255,0.08);
                    backdrop-filter: blur(15px);
                    border-radius: 20px;
                    padding: 25px;
                    margin-bottom: 30px;
                    box-shadow: 0 0 25px rgba(66,244,223,0.15);
                    transition: transform 0.3s, box-shadow 0.3s;
                    }
                    
                    .result:hover {
                    transform: translateY(-6px) scale(1.01);
                    box-shadow: 0 0 45px rgba(66,244,223,0.4);
                    }
                    
                    .title {
                    font-size: 24px;
                    color: #8ab4f8;
                    text-decoration: none;
                    }
                    
                    .title:hover {
                    text-decoration: underline;
                    }
                    
                    .url {
                    font-size: 14px;
                    color: #3cba54;
                    margin-top: 6px;
                    word-break: break-all;
                    }
                    
                    .contenuu {
                    margin-top: 15px;
                    font-size: 15px;
                    line-height: 1.7;
                    color: #e8eaed;
                   
                    }
                    
                    .auteurr {
                    margin-top: 12px;
                    font-size: 13px;
                    color: #9aa0a6;
                    }
                    
                    .badge {
                    display: inline-block;
                    padding: 4px 10px;
                    border-radius: 10px;
                    font-size: 12px;
                    margin-right: 8px;
                    background: linear-gradient(135deg, #c6fef7, #64d8fb);
                    color: #000;
                    font-weight: bold;
                    }
                    
                    .no-result {
                    text-align: center;
                    font-size: 20px;
                    margin-top: 80px;
                    color: #ff6b6b;
                    text-shadow: 0 0 10px rgba(255,107,107,0.6);
                    }
                </style>
            </head>
            
            <body>
                <div class="container1">
                    
                    <h2>
                        Résultats pour :
                        <strong>"<xsl:value-of select="$value"/>"</strong>
                    </h2>
                    
                    <xsl:for-each select="/articles/article[
                                          contains(titre, $value)
                                          or contains(auteur, $value)
                                          or contains(date, $value)
                                          or contains(contenu, $value)
                                          or contains(lien, $value)
                                          ]">
                        <div class="result">
                            <a class="title" href="details.html?id={@id}" target="_blank">
                                <xsl:value-of select="titre"/>
                            </a>
                            
                            <div class="url">
                                <a href="details.html?id={@id}" target="_blank">
                                <xsl:value-of select="lien"/>
                                </a>
                            </div>
                            
                            <div class="contenuu">
                                <xsl:value-of select="contenu"/>
                            </div>
                            
                            <div class="auteurr">
                                <span class="badge">Auteur</span>
                                <xsl:value-of select="auteur"/>
                                —
                                <span class="badge">Date</span>
                                <xsl:value-of select="date"/>
                            </div>
                        </div>
                    </xsl:for-each>
                    
                    <xsl:if test="not(/articles/article[
                                  contains(titre, $value)
                                  or contains(auteur, $value)
                                  or contains(date, $value)
                                  or contains(contenu, $value)
                                  or contains(lien, $value)
                                  ])">
                        <div class="no-result">
                            ❌ Aucun résultat trouvé pour "<xsl:value-of select="$value"/>"
                        </div>
                    </xsl:if>
                    
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
